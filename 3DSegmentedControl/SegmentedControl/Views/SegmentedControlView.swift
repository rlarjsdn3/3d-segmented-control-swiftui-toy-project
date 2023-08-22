//
//  SegmentedControlView.swift
//  SegmentedControl
//
//  Created by 김건우 on 2023/08/22.
//

import SwiftUI

struct SegmentedControlView: View {
    
    // MARK: - WRAPPER PROPERTIES
    
    @Binding var currentTab: Tab
    
    @State private var shakingValue: CGFloat = 0.0
    
    // MARK: - INTILAIZER
    
    init(selection tab: Binding<Tab>) {
        self._currentTab = tab
    }
    
    // MARK: - BODY
    
    var body: some View {
        HStack(spacing: 0) {
            tabbableText(.photo)
                .foregroundColor(Color.pink)
                .overlay {
                    CustomRectangle([.topLeft, .bottomLeft], cornerRadius: 50)
                        .fill(Color.pink)
                        .overlay {
                            tabbableText(Tab.video)
                                .foregroundColor(currentTab == .video ? Color.white : Color.clear)
                                .scaleEffect(x: -1)
                        }
                        .overlay {
                            tabbableText(Tab.photo)
                                .foregroundColor(currentTab == .photo ? Color.white : Color.clear)
                        }
                        .rotation3DEffect(
                            .degrees(currentTab == .photo ? 0 : 180),
                            axis: (x: 0, y: 1, z: 0),
                            anchor: .trailing,
                            perspective: 0.3
                        )
                }
                .contentShape(Rectangle())
                .zIndex(1)
            
            tabbableText(.video)
                .foregroundColor(Color.pink)
                .contentShape(Rectangle())
                .zIndex(0)
        }
        .background {
            ZStack {
                Capsule()
                    .fill(Color.white)
                
                Capsule()
                    .stroke(Color.pink, lineWidth: 2)
            }
        }
        .rotation3DEffect(
            .degrees(shakingValue),
            axis: (x: 0, y: 1, z: 0)
        )
    }
    
    // MARK: - FUNCTIONS
    
    func tabbableText(_ tab: Tab) -> some View {
        Text(tab.rawValue)
            .font(.title3)
            .fontWeight(.semibold)
            // 뷰에 변화가 생길 때 애니메이션을 어떻게 적용할 지를 결정하는 제어자
            .contentTransition(.interpolate)
            .padding(.vertical, 12)
            .padding(.horizontal, 40)
            // 탭 가능 영역을 설정하는 제어자
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 1.0)) {
                    currentTab = tab
                }
                
                withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.5)) {
                    shakingValue = (tab == .photo ? -10 : 10)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                    withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.5)) {
                        shakingValue = 0.0
                    }
                }
            }
    }
}



struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlView(selection: .constant(.photo))
    }
}
