// --- 1. アドレスの定義 ---
#define kViewMatrix 0x03A9A908

// --- 2. データの箱 ---
struct MyVec3 { float x, y, z; };
struct MyVec2 { float x, y; };

// --- 3. 描画メイン関数 (ここを1から作る！) ---
void DrawAibouESP() {
    // まずはテストで画面の真ん中に線を引いてみるじょ！
    ImGui::GetForegroundDrawList()->AddLine(
        ImVec2(kWidth/2, kHeight), // 画面下の中央
        ImVec2(kWidth/2, kHeight/2), // 画面の真ん中
        IM_COL32(0, 255, 0, 255), // 緑色
        2.0f // 線の太さ
    );
    
    ImGui::GetForegroundDrawList()->AddText(
        ImVec2(kWidth/2 - 50, kHeight/2 - 20),
        IM_COL32(255, 255, 255, 255),
        "TARGET LOCKED"
    );
}
