TARGET := iphone:clang:latest:14.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AibouESP

# 相棒が作ったファイルの名前をここに書くじょ！
AibouESP_FILES = ImGuiDrawView.mm Tweak.x
AibouESP_FRAMEWORKS = UIKit Metal MetalKit QuartzCore
AibouESP_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

