FINALPACKAGE = 1
DEBUG = 0

INSTALL_TARGET_PROCESSES = SpringBoard

ARCHS = armv7 armv7s arm64 arm64e
TARGET = iphone:clang::10

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = FlipswitchForSlices3

$(BUNDLE_NAME)_FILES = $(BUNDLE_NAME).xm
$(BUNDLE_NAME)_LIBRARIES = flipswitch substrate
$(BUNDLE_NAME)_INSTALL_PATH = /Library/Switches

include $(THEOS_MAKE_PATH)/bundle.mk
