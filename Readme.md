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

### Get the app

If this repo has a GitHub Release, download:

* `FlipFlip-Mac-Apple-Silicon.zip`

Unzip it, then open `FlipFlip.app`. If macOS blocks it because it is not notarized, control-click the app, choose **Open**, then choose **Open** again.

### Build it yourself

Requirements:

* macOS on Apple Silicon
* Node.js
* Yarn Classic (`1.x`)
* Xcode Command Line Tools (`xcode-select --install`)

Build the Apple Silicon app:

```sh
git clone https://github.com/vibegooning/flipflip_apple_silicon.git
cd flipflip_apple_silicon
yarn install
yarn package:mac-arm64
```

The built app will be created at:

* `FlipFlip-darwin-arm64/FlipFlip.app`
* `release/FlipFlip-Mac-Apple-Silicon.zip`

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
