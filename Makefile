DESTDIR ?=
PREFIX ?= /usr/local

UNAME_M := $(shell uname -m)

.PHONY: build
build:
	@echo "Building dyld_shared_cache_util"
	xcodebuild -target dyld_shared_cache_util  -sdk macosx11.0 -scheme dyld_shared_cache_util -configuration Debug -arch $(UNAME_M)  ARCHS=$(UNAME_M) ONLY_ACTIVE_ARCH=YES CONFIGURATION_BUILD_DIR=$(DESTDIR)

.PHONY: install
install:
	@echo "Installing dyld_shared_cache_util"
	$(MAKE) -C .
	@install -d $(DESTDIR)/$(PREFIX)/bin
	@install -m 777 $(DESTDIR)/dyld_shared_cache_util $(DESTDIR)/$(PREFIX)/bin

.PHONY: clean
clean:
	@echo "Cleaning..."
	rm -rf $(DESTDIR)