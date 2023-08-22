//
//  SampleGridView.swift
//  SegmentedControl
//
//  Created by 김건우 on 2023/08/22.
//

import SwiftUI

struct SampleGridView: View {
    
    // MARK: - PROPERTIES
    
    let showCircle: Bool
    
    let columns = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)
    ]
    
    // MARK: - INTILAIZER
    
    init(showCircle: Bool = false) {
        self.showCircle = showCircle
    }
    
    // MARK: - BODT
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(0..<30, id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 3)
                        .fill(Color.pink.opacity(0.2))
                        .frame(height: 130)
                        .overlay(alignment: .topTrailing) {
                            if showCircle {
                                Circle()
                                    .fill(Color.pink.opacity(0.4))
                                    .frame(width: 20, height: 20)
                                    .padding(5)
                            }
                        }
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

// MARK: - PREVIEW

struct SampleGridView_Previews: PreviewProvider {
    static var previews: some View {
        SampleGridView()
    }
}
