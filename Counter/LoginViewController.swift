import UIKit
private let userNameKey = "userName"

class LoginViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var logIn: UIButton!
    
    var userName: String = ""
    var password: String = ""
    var shouldSave = false
    
    @IBAction func userPasswordChanged(_ sender: UITextField) {
        password = sender.text ?? ""
        checkLogin()
    }
    @IBAction func userNameChanged(_ sender: UITextField) {
        userName = sender.text ?? ""
        checkLogin()
        if shouldSave {
            UserDefaults.standard.set(userName, forKey: userNameKey)
        }
    }
    @IBAction func onRememberMe(_ sender: UISwitch) {
        shouldSave = sender.isOn
        if shouldSave {
            UserDefaults.standard.set(userName, forKey: userNameKey)
        } else {
            UserDefaults.standard.removeObject(forKey: userNameKey)
        }
    }
}

extension LoginViewController {
    func checkLogin() {
        if userName != "" && password != "" {
            logIn.isEnabled = true
        } else {
            logIn.isEnabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userName = UserDefaults.standard.string(forKey: userNameKey) ?? ""
        self.username.text = self.userName
        UserDefaults.standard.removeObject(forKey: userNameKey)
    }
    
}

