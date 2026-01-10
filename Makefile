# プロジェクトの名前
TWEAK_NAME = AibouESP

# 使うファイルの名前（相棒が作ったやつ！）
AibouESP_FILES = ImGuiDrawView.mm Tweak.x

# 必要なフレームワーク
AibouESP_FRAMEWORKS = UIKit Metal MetalKit QuartzCore

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
