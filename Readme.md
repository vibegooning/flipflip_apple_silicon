<p align="center">
  <a href="https://ififfy.github.io/flipflip/">
    <img alt="flipflip" src="./docs/doc_images/flipflip_logo.png" height=320>
  </a>
</p>

<h1 align="center">FlipFlip</h1>
<p align="center">
  A glorified slideshow, with <i>lots</i> of bells and whistles
</p>

![Screenshot](./docs/doc_images/flipflip_home.png)

## Apple Silicon macOS Build

This fork packages FlipFlip for Apple Silicon Macs (`darwin-arm64`). The original upstream macOS release was Intel-only.

This fork also includes grid-player improvements aimed at large mixed image/video scene grids:

* Scene Grid rows and columns can be resized by dragging the grid dividers in the grid setup screen.
* Scene Grid cells share a media coordinator, reducing duplicate/recently played files across cells in the same grid window.
* Scene Grid media loading uses a shared memory/loading budget so a 2x3 grid does not multiply the original queue sizes by six.
* Queued videos in grid cells preload metadata first, and old video elements are paused, muted, and unloaded more aggressively.
* Blur video backgrounds are still supported; video blur redraws are throttled to video frame callbacks when possible.

### Get the app

If this repo has a GitHub Release, download:

* `FlipFlip-Mac-Apple-Silicon.dmg`
* `FlipFlip-Mac-Apple-Silicon.zip`

Open the DMG and drag `FlipFlip.app` to Applications, or unzip the ZIP and open `FlipFlip.app` directly.

This local fork build is unsigned and not notarized. If macOS blocks it, control-click `FlipFlip.app`, choose **Open**, then choose **Open** again.

### Build it yourself

Requirements:

* macOS on Apple Silicon
* Node.js 16 or newer
* Yarn Classic (`1.x`)
* Xcode Command Line Tools (`xcode-select --install`)

Build the Apple Silicon app and ZIP:

```sh
git clone https://github.com/vibegooning/flipflip_apple_silicon.git
cd flipflip_apple_silicon
yarn install
yarn package:mac-arm64
```

Build the Apple Silicon app, ZIP, and DMG:

```sh
yarn package:mac-arm64-dmg
```

The built app will be created at:

* `FlipFlip-darwin-arm64/FlipFlip.app`
* `release/FlipFlip-Mac-Apple-Silicon.zip`
* `release/FlipFlip-Mac-Apple-Silicon.dmg`

Run from source during development:

```sh
yarn install
yarn production
yarn start
```

## Links

* **[Original FlipFlip releases (Intel Mac/Windows/Linux)](https://github.com/ififfy/flipflip/releases/latest)**
* **[User manual](https://ififfy.github.io/flipflip/)**
* **[Subreddit](https://www.reddit.com/r/flipflip/)**

## Features
* Local files as well as Tumblr, ~~Reddit~~, ~~Twitter~~, Instagram, Imgur, DeviantArt, Booru & More
* Animated GIF and video support
* Grid view with cloneable grid cells
* Multiple windows
* Visual effects (zoom/transition, cross-fade, slide, strobe/pulse, fade in/out, panning, overlay)
* Randomized and ordered playback
* Timing control
* Caption scripting support
* Audio track/playlist support and Audio Library to organize tracks
* Library and Tagging to organize sources and generate slideshows
* Easy to share!

## Quick start

Check out our [quick start](https://ififfy.github.io/flipflip/#/quickstart) guide.

## Contributing

Create a new branch, make your changes, and open a pull request. The policy of the FlipFlip project is, 
"patches are generally accepted." See the [developers](https://ififfy.github.io/flipflip/#/developers) 
documentation to get started.

## Donate

Enjoying FlipFlip? [Buy me a coffee](https://ko-fi.com/flipflipapp) and help support FlipFlip development!
