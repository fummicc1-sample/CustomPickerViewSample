import UIKit

class CustomPickerContent: UIView {
    
    // Xib上に配置したUILabel
    @IBOutlet var label: UILabel!

    // Xibが読み込まれると実行される
    override func awakeFromNib() {
        super.awakeFromNib()
        // 影をつけている
        
        // 影のずれを設定
        layer.shadowOffset = CGSize(width: 0, height: 2)
        // 影の不透明度を設定（0~1の範囲で大きいほど影が濃い）
        layer.shadowOpacity = 0.4
        // 影の色を設定
        layer.shadowColor = UIColor.gray.cgColor
        
        // 枠線をつけている
        layer.borderWidth = 2
    }
    
}
