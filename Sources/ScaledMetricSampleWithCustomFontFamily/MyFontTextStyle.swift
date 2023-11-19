//
//  Created by Ain Obara
//

import SwiftUI

extension MyFont {

    enum TextStyle {

        case title
        case body
        case subheadline
        case caption
    }
}

extension MyFont.TextStyle {

    var defaultSize: Double {
        switch self {
        case .title:
            return 21
        case .body:
            return 17
        case .subheadline:
            return 15
        case .caption:
            return 12
        }
    }

    var relativeStyle: Font.TextStyle {
        switch self {
        case .title:
            return .title
        case .body:
            return .body
        case .subheadline:
            return .subheadline
        case .caption:
            return .caption
        }
    }
}
