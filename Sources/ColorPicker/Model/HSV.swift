import UIKit

public struct HSV: Equatable, Hashable, Sendable {
    var h, s, v: Double
}

extension HSV {
    func makeColor() -> UIColor {
        UIColor(hue: h, saturation: s, brightness: v, alpha: 1)
    }

    var rgb: RGB {
        guard s != 0 else { return RGB(r: v, g: v, b: v) }
        let h6 = h * 6
        let i = Int(h6) % 6
        let f = h6 - Double(Int(h6))
        let p = v * (1 - s)
        let q = v * (1 - s * f)
        let t = v * (1 - s * (1 - f))
        switch i {
        case 0: return RGB(r: v, g: t, b: p)
        case 1: return RGB(r: q, g: v, b: p)
        case 2: return RGB(r: p, g: v, b: t)
        case 3: return RGB(r: p, g: q, b: v)
        case 4: return RGB(r: t, g: p, b: v)
        default: return RGB(r: v, g: p, b: q)
        }
    }
}

public struct HSVA: Equatable, Hashable, Sendable {
    var hsv: HSV
    var a: Double
}

extension HSVA {
    public init(_ color: UIColor) {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var v: CGFloat = 0
        var a: CGFloat = 0
        color.getHue(&h, saturation: &s, brightness: &v, alpha: &a)
        self.hsv = HSV(h: h, s: s, v: v)
        self.a = a
    }

    public func makeColor() -> UIColor {
        hsv.makeColor().withAlphaComponent(a)
    }
}

extension HSVA {
    static var noop: HSVA { HSVA(hsv: HSV(h: 0, s: 0, v: 0), a: 0) }
}
