import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var foodPickerView: UIPickerView! // 食べ物のPickerView
    @IBOutlet var drinkPickerView: UIPickerView! // 飲み物のPickerView
    
    // 飲み物のデータの配列
    var drinkArray: [String] = [
        "爽健美茶",
        "麦茶",
        "コーラ",
        "オレンジジュース",
        "天然水"
    ]
    
    // 食べ物のデータの配列
    var foodArray: [String] = [
        "ラーメン",
        "トマト",
        "生ハム",
        "きゅうり",
        "納豆",
        "お米"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // データソースの設定
        drinkPickerView.dataSource = self
        foodPickerView.dataSource = self
        
        // デリゲートの設定
        drinkPickerView.delegate = self
        foodPickerView.delegate = self
    }

    // PickerView一つあたりのの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // PickerView一つあたりの行の数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == foodPickerView {
            return foodArray.count
        }
        
        if pickerView == drinkPickerView {
            return drinkArray.count
        }
        
        return 0
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == foodPickerView {
            return foodArray[row]
        }
        if pickerView == drinkPickerView {
            return drinkArray[row]
        }
        return nil
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        // Xibファイルを読み込む
        let customView = UINib(nibName: "CustomPickerContent", bundle: nil).instantiate(withOwner: nil, options: nil).first as! CustomPickerContent
        
        // 高さを40に固定
        customView.frame.size.height = 40
        
        // PickerViewに応じて表示するデータを設定する
        if pickerView == foodPickerView {
            customView.label.text = foodArray[row]
        } else if pickerView == drinkPickerView {
            customView.label.text = drinkArray[row]
        }
        
        return customView
    }
}

