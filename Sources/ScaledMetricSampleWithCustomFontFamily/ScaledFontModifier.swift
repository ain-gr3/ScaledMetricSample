//
//  Created by Ain Obara
//

import SwiftUI

private struct ScaledFontModifier: ViewModifier {

    @ScaledMetric var scale: Double
    var font: MyFont

    init(font: MyFont) {
        self._scale = .init(
            wrappedValue: font.style.defaultSize,
            relativeTo: font.style.relativeStyle
        )
        self.font = font
    }

    func body(content: Content) -> some View {
        switch font.family {
        case .system(let weight):
            content
                .font(.system(size: scale, weight: weight))
        case .custom(let ttfFile):
            content
                .font(.custom(ttfFile.name, size: scale))
        }
    }
}

extension View {

    func scaledFont(_ font: MyFont) -> some View {
        modifier(ScaledFontModifier(font: font))
    }
}

#if DEBUG

struct MyFont_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            HStack {
                Group {
                    Text("title")
                    Text("ABC あいう")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
                .scaledFont(.title(.custom(.pacificoRegular)))
            }
            HStack {
                Group {
                    Text("body")
                    Text("ABC あいう")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
                .scaledFont(.body(.custom(.pacificoRegular)))
            }
            HStack {
                Group {
                    Text("subheadline")
                    Text("ABC あいう")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
                .scaledFont(.subheadline(.custom(.pacificoRegular)))
            }
            HStack {
                Group {
                    Text("caption")
                    Text("ABC あいう")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
                .scaledFont(.caption(.custom(.pacificoRegular)))
            }
        }
        .padding()
    }
}

#endif
