TARGET := iphone:clang:latest:14.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AibouESP

# 🌟 ImGuiの本体ファイルも全部一緒にビルドするように指定するじょ！
AibouESP_FILES = Tweak.x ImGuiDrawView.mm imgui.cpp imgui_draw.cpp imgui_widgets.cpp imgui_tables.cpp imgui_impl_metal.mm

AibouESP_FRAMEWORKS = UIKit Metal MetalKit QuartzCore
AibouESP_CFLAGS = -fobjc-arc -I.

include $(THEOS_MAKE_PATH)/tweak.mk
