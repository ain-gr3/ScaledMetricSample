//
//  File.swift
//  
//
//  Created by Ain Obara on 2023/11/19.
//

import SwiftUI

enum MyTextStyle {

    case title(Font.Weight = .bold)
    case body(Font.Weight = .regular)
    case subheadline(Font.Weight = .regular)
    case caption(Font.Weight = .regular)
}

private extension MyTextStyle {

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

    var weight: Font.Weight {
        switch self {
        case .title(let weight),
            .body(let weight),
            .subheadline(let weight),
            .caption(let weight):
            return weight
        }
    }
}

private struct ScaledFontModifier: ViewModifier {

    @ScaledMetric var scale: Double
    var weight: Font.Weight

    init(_ style: MyTextStyle) {
        self._scale = .init(
            wrappedValue: style.defaultSize,
            relativeTo: style.relativeStyle
        )
        self.weight = style.weight
    }

    func body(content: Content) -> some View {
        content
            .font(.system(size: scale, weight: weight))
    }
}

extension View {

    func scaledFont(_ style: MyTextStyle) -> some View {
        modifier(ScaledFontModifier(style))
    }
}

#if DEBUG

struct MyTextStyle_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            HStack {
                Group {
                    Text("title")
                    Text("ABC あいう")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
                .scaledFont(.title())
            }
            HStack {
                Group {
                    Text("body")
                    Text("ABC あいう")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
                .scaledFont(.body())
            }
            HStack {
                Group {
                    Text("subheadline")
                    Text("ABC あいう")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
                .scaledFont(.subheadline())
            }
            HStack {
                Group {
                    Text("caption")
                    Text("ABC あいう")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
                .scaledFont(.caption())
            }
        }
        .padding()
    }
}

#endif
