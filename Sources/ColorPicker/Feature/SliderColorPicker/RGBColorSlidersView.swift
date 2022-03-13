import UIKit

class RGBColorSlidersView: UIControl {
    let redSlider = ColorSliderWithInputView()
    let greenSlider = ColorSliderWithInputView()
    let blueSlider = ColorSliderWithInputView()
    
    private var _color: UIColor = .white
    
    var color: UIColor {
        get { _color }
        set {
            _color = newValue
            redSlider.color = newValue
            greenSlider.color = newValue
            blueSlider.color = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        redSlider.slider.configuration = .red
        redSlider.textField.configuration = .hex
        redSlider.titleLabel.text = "レッド"
        
        greenSlider.slider.configuration = .green
        greenSlider.textField.configuration = .hex
        greenSlider.titleLabel.text = "グリーン"
        
        blueSlider.slider.configuration = .blue
        blueSlider.textField.configuration = .hex
        blueSlider.titleLabel.text = "ブルー"
        
        let vStack = UIStackView(arrangedSubviews: [redSlider, greenSlider, blueSlider])
        vStack.axis = .vertical
        vStack.spacing = 16
        addSubview(vStack)
        
        vStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let valueSyncAction = UIAction { action in
            let slider = (action.sender as! ColorSliderWithInputView).slider
            self.color = slider.color
            self.sendActions(for: [.valueChanged, .primaryActionTriggered])
        }
        redSlider.addAction(valueSyncAction, for: .primaryActionTriggered)
        greenSlider.addAction(valueSyncAction, for: .primaryActionTriggered)
        blueSlider.addAction(valueSyncAction, for: .primaryActionTriggered)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}