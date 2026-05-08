import SceneGridCell from "./SceneGridCell";

export function resizeGridWeights(weights: Array<number>, length: number): Array<number> {
  const nextWeights = Array<number>();
  const sourceWeights = weights ? weights : [];

  for (let i = 0; i < length; i++) {
    const weight = Number(sourceWeights[i]);
    nextWeights.push(isFinite(weight) && weight > 0 ? weight : 1);
  }

  return nextWeights;
}

export function gridTemplateFromWeights(weights: Array<number>): string {
  return weights.map((weight) => weight.toString() + "fr").join(" ");
}

export function gridLinePercentages(weights: Array<number>): Array<number> {
  const total = weights.reduce((sum, weight) => sum + weight, 0);
  let running = 0;

  return weights.slice(0, weights.length - 1).map((weight) => {
    running += weight;
    return total > 0 ? (running / total) * 100 : 0;
  });
}

export default class SceneGrid {
  id: number = 0;
  name: string;
  grid: Array<Array<SceneGridCell>> = [[new SceneGridCell()]];
  rowWeights: Array<number> = [1];
  columnWeights: Array<number> = [1];

  constructor(init?: Partial<SceneGrid>) {
    Object.assign(this, init);

    this.grid = this.grid.map((r) => r.map((c) => {
      if (!c.sceneID) {
        return new SceneGridCell({sceneID: parseInt(c as any)})
      } else {
        return c;
      }
    }));

    const height = this.grid && this.grid.length > 0 ? this.grid.length : 1;
    const width = this.grid && this.grid.length > 0 && this.grid[0].length > 0 ? this.grid[0].length : 1;
    this.rowWeights = resizeGridWeights(this.rowWeights, height);
    this.columnWeights = resizeGridWeights(this.columnWeights, width);
  }
}
