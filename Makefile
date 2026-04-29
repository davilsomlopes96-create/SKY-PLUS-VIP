DEBUG = 0
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SkyPlusVIP
SkyPlusVIP_FILES = Tweak.xm
SkyPlusVIP_CFLAGS = -fobjc-arc
SkyPlusVIP_LIBRARIES = substrate

include $(THEOS_MAKE_PATH)/tweak.mk
