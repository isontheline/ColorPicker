import UIKit

public class ColorPickerConfiguration {
    public static var `default`: ColorPickerConfiguration { ColorPickerConfiguration() }
    
    public var initialColor: CGColor = .white
    
    public var colorPickers: [UIControl & ColorPicker] = [
        GridColorPicker(frame: .null),
        ClassicColorPicker(frame: .null),
        RGBHexSliderColorPicker(frame: .null),
        HSBHexSliderColorPicker(frame: .null),
    ]
    
    public var initialColorItems: [ColorItem]? = nil
    
    public var usesSwatchTool: Bool = true
    
    public var usesDropperTool: Bool = true
}
