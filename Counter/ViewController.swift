import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var textView: UITextView!
    
    private(set) var counter: Int = 0
}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = """
            Значение счётчика:
            0
            """
        textView.text = "История изменений:"
    }
}

private extension ViewController {
    @IBAction func increaseCounter(_ sender: UIButton) {
        counter += 1
        updateLabel()
        textView.text += prefix + "значение изменено на +1"
    }
    
    @IBAction func decreaseCounter(_ sender: Any) {
        if counter > 0 {
            counter = counter - 1
            updateLabel()
            textView.text += prefix + "значение изменено на -1"
        } else {
            textView.text += prefix + "попытка уменьшить значение счётчика ниже 0"
        }
    }
    
    @IBAction func zeroButton(_ sender: UIButton) {
        counter = 0
        updateLabel()
        textView.text += prefix + "значение сброшено"
    }

    var prefix: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
        let date = dateFormatter.string(from: Date.now)
        return "\n\(date): "
    }
    
    func updateLabel() {
        label.text = """
            Значение счётчика:
            \(counter)
            """
    }
}

