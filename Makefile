.PHONY: build deploy

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))
router := $(MAKE) -C router

build:
	@rm -rf public
	@mkdir -p public
	@$(router) build
	@mv -f router/build/web public/router

deploy:
	@firebase deploy

