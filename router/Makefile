.PHONY: clean format get upgrade upgrade-major codegen outdated serve build

clean:
	@echo "Cleaning the project"
	@flutter clean

format:
	@echo "Formatting the code"
	@dart fix --apply .
	@dart format -l 120 --fix .

get:
	@echo "Geting dependencies"
	@echo ${mkfile_path}
	@flutter pub get

build: codegen
	@flutter build web --release --no-source-maps \
		--pwa-strategy offline-first \
		--web-renderer canvaskit --dart-define=FLUTTER_WEB_USE_SKIA=true \
		--base-href /router/

upgrade: get
	@echo "Upgrading dependencies"
	@flutter pub upgrade

upgrade-major: get
	@echo "Upgrading dependencies --major-versions"
	@flutter pub upgrade --major-versions

codegen: get
	@echo "Running codegeneration"
	@flutter pub run build_runner build --delete-conflicting-outputs --release

outdated:
	@flutter pub outdated

serve: codegen
	@echo "Serve as web app"
	flutter run -d web-server
