//
//  CustomRectangle.swift
//  SegmentedControl
//
//  Created by 김건우 on 2023/08/22.
//

import SwiftUI

struct CustomRectangle: Shape {
    
    // MARK: - PROPERTIES
    
    let corners: UIRectCorner
    let cornerRadius: CGFloat
    
    // MARK: - INTILALIZER
    
    init(_ corners: UIRectCorner, cornerRadius: CGFloat) {
        self.corners = corners
        self.cornerRadius = cornerRadius
    }
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
        )
        return Path(path.cgPath)
    }
}
