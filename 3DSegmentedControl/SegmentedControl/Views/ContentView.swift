//
//  ContentView.swift
//  3DSegmentedControl
//
//  Created by 김건우 on 2023/08/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - WRAPPER PROPERTIES
    
    // 현재 선택한 탭을 가리키는 래퍼 프로퍼티
    @State private var currentTab: Tab = .photo
    
    // MARK: - INTILAIZER
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            SegmentedControlView(selection: $currentTab)
                .padding(12)
            
            TabView(selection: $currentTab) {
                SampleGridView(showCircle: false)
                    .tag(Tab.photo)
                
                SampleGridView(showCircle: true)
                    .tag(Tab.video)
            }
        }
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
