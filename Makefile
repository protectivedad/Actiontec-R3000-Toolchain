BUILD_DIR = $(shell pwd)
include $(BUILD_DIR)/make.common

.PHONY: all clean distclean

all:
	$(MAKE) -C toolchain

clean:
	$(MAKE) -C toolchain clean

distclean:
	$(MAKE) -C toolchain distclean
	rm -rf $(TOOLCHAIN)
