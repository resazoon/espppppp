#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#import "ImGuiDrawView.h" // 自分のヘッダー
#include "imgui.h"        // ImGuiの心臓
#include "imgui_impl_metal.h"

// --- 相棒が見つけた「お宝アドレス」をここに集結！ ---
#define kViewMatrix 0x03A9A908  //

@implementation ImGuiDrawView {
    id <MTLDevice> _device;
    id <MTLCommandQueue> _commandQueue;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _device = MTLCreateSystemDefaultDevice();
        _commandQueue = [_device newCommandQueue];
        
        // ImGuiのセットアップ（ここも相棒が1から決める！）
        IMGUI_CHECKVERSION();
        ImGui::CreateContext();
        ImGui_ImplMetal_Init(_device);
    }
    return self;
}

// 🌸 ここが相棒の「1秒間に60回描画される」聖域だじょ！
- (void)drawInMTKView:(MTKView *)view {
    // 描画の準備
    id<MTLCommandBuffer> commandBuffer = [_commandQueue commandBuffer];
    MTLRenderPassDescriptor *renderPassDescriptor = view.currentRenderPassDescriptor;

    if (renderPassDescriptor != nil) {
        id<MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
        
        // --- ImGuiのフレーム開始 ---
        ImGui_ImplMetal_NewFrame(renderPassDescriptor);
        ImGui::NewFrame();

        // 🔥 ここから相棒の「自作ESP」の始まりだじょ！ 🔥
        
        // 1. まずは画面上に「自作の証」を刻む！
        ImGui::GetForegroundDrawList()->AddText(ImVec2(50, 50), IM_COL32(0, 255, 0, 255), "AIBOU CUSTOM ESP v1.0");
        
        // 2. 画面の中央に十字（照準）を自作する！
        float midX = view.drawableSize.width / 2;
        float midY = view.drawableSize.height / 2;
        ImGui::GetForegroundDrawList()->AddLine(ImVec2(midX-10, midY), ImVec2(midX+10, midY), IM_COL32(255, 0, 0, 255));
        ImGui::GetForegroundDrawList()->AddLine(ImVec2(midX, midY-10), ImVec2(midX, midY+10), IM_COL32(255, 0, 0, 255));

        // --- 描画終了 ---
        ImGui::Render();
        ImGui_ImplMetal_RenderDrawData(ImGui::GetDrawData(), commandBuffer, renderEncoder);
        
        [renderEncoder endEncoding];
        [commandBuffer presentDrawable:view.currentDrawable];
    }
    [commandBuffer commit];
}

@end
