import {getRandomListItem} from "../../data/utils";

export default class GridMediaCoordinator {
  private readonly maxRecent: number;
  private readonly recentURLs = Array<string>();
  private readonly reservedURLs = new Map<string, number>();

  constructor(maxRecent: number) {
    this.maxRecent = Math.max(20, maxRecent);
  }

  chooseURL(collection: Array<string>): string {
    this.expireReservations();

    const freshCollection = collection.filter((url) => !this.hasRecentlySeen(url));
    const url = getRandomListItem(freshCollection.length > 0 ? freshCollection : collection);
    this.reserve(url);
    return url;
  }

  remember(url: string) {
    const key = this.normalize(url);
    if (!key) return;

    this.reservedURLs.delete(key);
    const existingIndex = this.recentURLs.indexOf(key);
    if (existingIndex >= 0) {
      this.recentURLs.splice(existingIndex, 1);
    }
    this.recentURLs.push(key);

    while (this.recentURLs.length > this.maxRecent) {
      this.recentURLs.shift();
    }
  }

  release(url: string) {
    const key = this.normalize(url);
    if (key) {
      this.reservedURLs.delete(key);
    }
  }

  private reserve(url: string) {
    const key = this.normalize(url);
    if (key) {
      this.reservedURLs.set(key, Date.now());
    }
  }

  private hasRecentlySeen(url: string): boolean {
    const key = this.normalize(url);
    return this.recentURLs.includes(key) || this.reservedURLs.has(key);
  }

  private expireReservations() {
    const cutoff = Date.now() - 60000;
    for (let [url, timestamp] of this.reservedURLs.entries()) {
      if (timestamp < cutoff) {
        this.reservedURLs.delete(url);
      }
    }
  }

  private normalize(url: string): string {
    if (!url) return null;

    const subtitleSplit = url.split("|||");
    const urlWithoutSubtitles = subtitleSplit[0];
    const clipMatch = /(.*):::\d+:[\d-]+:::\d+\.?\d*:\d+\.?\d*$/.exec(urlWithoutSubtitles);
    return clipMatch ? clipMatch[1] : urlWithoutSubtitles;
  }
}
