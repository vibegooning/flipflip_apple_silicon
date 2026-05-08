.PHONY: app app-mac app-mac-arm64 app-mac-x64 dmg-mac-arm64 prepare-app

PACKAGER := ./node_modules/.bin/electron-packager
YARN ?= yarn
APP_DIR := app
RELEASE_DIR := release
MAC_ICON := src/renderer/icons/flipflip_logo.icns
WIN_ICON := src/renderer/icons/flipflip_logo.ico
LINUX_ICON := src/renderer/icons/flipflip_logo.iconset/icon_512x512@2x.png

prepare-app:
	$(YARN) production
	rm -rf $(APP_DIR)
	mkdir -p $(APP_DIR)
	mkdir -p $(RELEASE_DIR)
	cp -r dist $(APP_DIR)/dist
	cp package.json $(APP_DIR)/package.json

app: prepare-app
	$(PACKAGER) $(APP_DIR) FlipFlip --platform=darwin --arch=arm64 --icon="$(MAC_ICON)" --overwrite
	$(PACKAGER) $(APP_DIR) FlipFlip --platform=darwin --arch=x64 --icon="$(MAC_ICON)" --overwrite
	$(PACKAGER) $(APP_DIR) FlipFlip --platform=win32 --arch=x64 --icon="$(WIN_ICON)" --overwrite
	$(PACKAGER) $(APP_DIR) FlipFlip --platform=win32 --arch=ia32 --icon="$(WIN_ICON)" --overwrite
	$(PACKAGER) $(APP_DIR) FlipFlip --platform=linux --arch=x64 --icon="$(LINUX_ICON)" --overwrite
	$(PACKAGER) $(APP_DIR) FlipFlip --platform=linux --arch=ia32 --icon="$(LINUX_ICON)" --overwrite
	zip -r $(RELEASE_DIR)/FlipFlip-Mac-Apple-Silicon.zip FlipFlip-darwin-arm64
	zip -r $(RELEASE_DIR)/FlipFlip-Mac-Intel.zip FlipFlip-darwin-x64
	zip -r $(RELEASE_DIR)/FlipFlip-Windows.zip FlipFlip-win32-x64
	zip -r $(RELEASE_DIR)/FlipFlip-Windows-32bit.zip FlipFlip-win32-ia32
	zip -r $(RELEASE_DIR)/FlipFlip-Linux.zip FlipFlip-linux-x64
	zip -r $(RELEASE_DIR)/FlipFlip-Linux-32bit.zip FlipFlip-linux-ia32

app-mac: prepare-app
	$(PACKAGER) $(APP_DIR) FlipFlip --platform=darwin --arch=arm64 --icon="$(MAC_ICON)" --overwrite
	$(PACKAGER) $(APP_DIR) FlipFlip --platform=darwin --arch=x64 --icon="$(MAC_ICON)" --overwrite
	zip -r $(RELEASE_DIR)/FlipFlip-Mac-Apple-Silicon.zip FlipFlip-darwin-arm64
	zip -r $(RELEASE_DIR)/FlipFlip-Mac-Intel.zip FlipFlip-darwin-x64

app-mac-arm64: prepare-app
	$(PACKAGER) $(APP_DIR) FlipFlip --platform=darwin --arch=arm64 --icon="$(MAC_ICON)" --overwrite
	zip -r $(RELEASE_DIR)/FlipFlip-Mac-Apple-Silicon.zip FlipFlip-darwin-arm64

dmg-mac-arm64: app-mac-arm64
	hdiutil create -volname FlipFlip -srcfolder FlipFlip-darwin-arm64/FlipFlip.app -ov -format UDZO $(RELEASE_DIR)/FlipFlip-Mac-Apple-Silicon.dmg

app-mac-x64: prepare-app
	$(PACKAGER) $(APP_DIR) FlipFlip --platform=darwin --arch=x64 --icon="$(MAC_ICON)" --overwrite
	zip -r $(RELEASE_DIR)/FlipFlip-Mac-Intel.zip FlipFlip-darwin-x64
