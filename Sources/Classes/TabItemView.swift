import UIKit

final class TabItemView: UIView {

    private(set) var titleLabel: UILabel = UILabel()

    public var textColor: UIColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1.0)
    public var selectedTextColor: UIColor = .white

    public var isSelected: Bool = false {
        didSet {
            if isSelected {
                titleLabel.textColor = selectedTextColor
            } else {
                titleLabel.textColor = textColor
            }
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)

        setupLabel()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
    }

    public func titleWidth() -> CGFloat {
        let width = NSAttributedString(string: titleLabel.text ?? "",
                                       attributes: [.font: titleLabel.font])
            .boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 50),
                          options: .usesLineFragmentOrigin, context: nil).width
        return width
    }

    private func setupLabel() {
        titleLabel = UILabel(frame: bounds)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        titleLabel.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1.0)
        titleLabel.backgroundColor = UIColor.clear
        addSubview(titleLabel)
        layoutLabel()
    }

    private func layoutLabel() {

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
