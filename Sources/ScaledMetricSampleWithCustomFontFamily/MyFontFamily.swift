//
//  Created by Ain Obara
//

import SwiftUI

extension MyFont {

    enum Family {

        enum TTF: CaseIterable {

            case pacificoRegular
        }

        case system(Font.Weight)
        case custom(TTF)
    }
}

extension MyFont.Family.TTF {

    var name: String {
        if !myFontFamilies.isInitialized {
            myFontFamilies.register()
            myFontFamilies.isInitialized = true
        }

        return _name
    }
}

// MARK: - MyFontFamilies

private var myFontFamilies = MyFontFamilies()

private struct MyFontFamilies {

    var isInitialized = false

    func register() {
        var error: Unmanaged<CFError>?
        MyFont.Family.TTF.allCases.forEach {
            guard let fontURL = Bundle.module.url(forResource: $0._name, withExtension: "ttf"),
                  let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
                  let font = CGFont(fontDataProvider) else {
                return
            }

            CTFontManagerRegisterGraphicsFont(font, &error)
        }
    }
}

private extension MyFont.Family.TTF {

    var _name: String {
        switch self {
        case .pacificoRegular:
            return "Pacifico-Regular"
        }
    }
}
