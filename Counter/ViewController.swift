//
//  ViewController.swift
//  Counter
//
//  Created by Svetlana Bochkareva on 07.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var counter: Int = 0
    
    @IBOutlet weak var textView: UITextView!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        
        textView.text = "История изменений:"
    }
}

