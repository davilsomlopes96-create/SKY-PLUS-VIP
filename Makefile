DEBUG = 0
FINALPACKAGE = 1
ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SkyPlusVIP
SkyPlusVIP_FILES = Tweak.xm
SkyPlusVIP_CFLAGS = -fobjc-arc
SkyPlusVIP_LIBRARIES = substrate
SkyPlusVIP_FRAMEWORKS = UIKit Foundation Security

include $(THEOS_MAKE_PATH)/tweak.mk
