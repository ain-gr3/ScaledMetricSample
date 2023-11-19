//
//  Created by Ain Obara
//

import SwiftUI

struct MyFont {

    var family: Family
    var style: TextStyle

    fileprivate init(family: Family, style: TextStyle) {
        self.family = family
        self.style = style
    }
}

extension MyFont {

    static func title(_ family: Family) -> Self {
        .init(family: family, style: .title)
    }

    static func body(_ family: Family) -> Self {
        .init(family: family, style: .body)
    }
    
    static func subheadline(_ family: Family) -> Self {
        .init(family: family, style: .subheadline)
    }

    static func caption(_ family: Family) -> Self {
        .init(family: family, style: .caption)
    }
}

extension MyFont {

    static func title(_ weight: Font.Weight = .bold) -> Self {
        .init(family: .system(weight), style: .title)
    }

    static func body(_ weight: Font.Weight = .regular) -> Self {
        .init(family: .system(weight), style: .body)
    }

    static func subheadline(_ weight: Font.Weight = .regular) -> Self {
        .init(family: .system(weight), style: .subheadline)
    }

    static func caption(_ weight: Font.Weight = .regular) -> Self {
        .init(family: .system(weight), style: .caption)
    }
}
