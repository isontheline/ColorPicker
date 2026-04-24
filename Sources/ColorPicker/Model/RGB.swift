import UIKit

struct RGB {
    var r, g, b: Double
}

extension RGB {
    func makeColor() -> UIColor {
        UIColor(red: r, green: g, blue: b, alpha: 1)
    }

    var hsv: HSV {
        let cmax = max(r, g, b)
        let cmin = min(r, g, b)
        let delta = cmax - cmin
        let s = cmax == 0 ? 0.0 : delta / cmax
        let v = cmax
        let h: Double
        if delta == 0 {
            h = 0
        } else if cmax == r {
            h = (((g - b) / delta).truncatingRemainder(dividingBy: 6)) / 6
        } else if cmax == g {
            h = ((b - r) / delta + 2) / 6
        } else {
            h = ((r - g) / delta + 4) / 6
        }
        return HSV(h: (h + 1).truncatingRemainder(dividingBy: 1), s: s, v: v)
    }
}

struct RGBA {
    var rgb: RGB
    var a: Double
}

extension RGBA {
    init(_ color: UIColor) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        self.rgb = RGB(r: r, g: g, b: b)
        self.a = a
    }

    func makeColor() -> UIColor {
        rgb.makeColor().withAlphaComponent(a)
    }
}
