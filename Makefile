# 1. ターゲット（どのiPhone向けに作るか）の指定
# 最新のSDKを使いつつ、iOS 14以降で動くように設定するじょ
TARGET := iphone:clang:latest:14.0
# 最近のiPhone（64bit）すべてに対応させる魔法の言葉
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

# 2. プロジェクトの名前
TWEAK_NAME = AibouESP

# 3. 🍳 使う材料（ソースファイル）を全部並べる！
# ここに書いたファイルがリポジトリに存在しないとエラーになるから注意だじょ！
AibouESP_FILES = Tweak.x \
                 ImGuiDrawView.mm \
                 imgui.cpp \
                 imgui_draw.cpp \
                 imgui_widgets.cpp \
                 imgui_tables.cpp \
                 imgui_demo.cpp \
                 imgui_impl_metal.mm

# 4. 🍎 Appleのシステム部品（フレームワーク）を借りる
AibouESP_FRAMEWORKS = UIKit Metal MetalKit QuartzCore

# 5. ビルドの設定（メモリ管理を自動化して、今のフォルダを検索対象にする）
AibouESP_CFLAGS = -fobjc-arc -I.

include $(THEOS_MAKE_PATH)/tweak.mk
