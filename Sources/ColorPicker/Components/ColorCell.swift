import UIKit

class ColorCell: UICollectionViewCell {
    
    let colorView: ColorView = .init(frame: .null)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        contentView.addSubview(colorView)
        colorView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(36)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class ColorView: UIView {
    
    @Invalidating(.display)
    var color: CGColor = .white
    
    enum Style {
        case normal
        case outlined
    }
    
    @Invalidating(.display)
    var style: Style = .normal
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        switch style {
        case .normal:
            let size = CGSize(width: 30, height: 30)
            context.setFillColor(color)
            let origin = CGPoint(
                x: (rect.width - size.width) / 2,
                y: (rect.height - size.height) / 2
            )
            context.fillEllipse(in: CGRect(origin: origin, size: size))
        case .outlined:
            do { // inner ellipse
                let size = CGSize(width: 17, height: 17)
                context.setFillColor(color)
                let origin = CGPoint(
                    x: (rect.width - size.width) / 2,
                    y: (rect.height - size.height) / 2
                )
                context.fillEllipse(in: CGRect(origin: origin, size: size))
            }
            do { // outline
                let size = CGSize(width: 28, height: 28)
                let origin = CGPoint(
                    x: (rect.width - size.width) / 2,
                    y: (rect.height - size.height) / 2
                )
                context.setStrokeColor(color)
                context.setLineWidth(3)
                context.strokeEllipse(in: CGRect(origin: origin, size: size))
            }
        }
    }
}
