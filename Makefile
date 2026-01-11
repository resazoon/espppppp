# ターゲットを少し古めにして安定させるじょ
TARGET := iphone:clang:latest:14.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AibouESP

# 🌟 今リポジトリに本当にあるファイルだけを指定するニダ！
AibouESP_FILES = ImGuiDrawView.mm
AibouESP_FRAMEWORKS = UIKit Metal MetalKit QuartzCore
AibouESP_CFLAGS = -fobjc-arc -I.

include $(THEOS_MAKE_PATH)/tweak.mk
