#
# In most cases, you only need to modify this first section.
#

all: build

CURR_DIR := $(shell pwd)
BUILD_DIR:=$(subst /toolchain, /toolchain,$(CURR_DIR))
BUILD_DIR:=$(word 1, $(BUILD_DIR))
export BUILD_DIR

include $(BUILD_DIR)/make.common

APP=linux-3.4rt
LOC=https://github.com/protectivedad/Actiontec-R3000-33.162L.16-BellAliant.git/trunk/bcm963xx_gpl_consumer/kernel

CONFIGURE_ARGS := \
	ARCH=$(TARGET_ARCH) \
	INSTALL_HDR_PATH=$(TOOLCHAIN_SYSROOT)

SOURCE_ID_FILE = $(CURR_DIR)/$(APP)-SOURCE_ID_$(TOOLCHAIN_PREFIX)_$(LINUX_VER_STR)

.PHONY: headers clean distclean shell

$(SOURCE_ID_FILE) :
	svn export $(LOC)/$(APP) $(APP) 1>$(SOURCE_ID_FILE) 2>&1
	@echo "$(APP) is pulled"

headers : $(SOURCE_ID_FILE)
	$(MAKE) -C $(APP) $(CONFIGURE_ARGS) headers_install
	rm `find $(TOOLCHAIN_SYSROOT) -name .install`
	rm `find $(TOOLCHAIN_SYSROOT) -name ..install.cmd`

clean:

distclean:
	rm -rf $(APP) $(APP)-*_ID_*

# Shell target permits creating an interacive shell for debugging
shell:
	bash -i


