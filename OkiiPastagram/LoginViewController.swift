//
//  LoginViewController.swift
//  OkiiPastagram
//
//  Created by okii on 18/10/21.
//

import UIKit
import Parse
class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
   
    @IBAction func onSignup(_ sender: Any) {
        let user = PFUser()
        user.username = self.usernameField.text
        user.password = self.passwordField.text
        user.signUpInBackground { (success, error) in
            if success{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else{
                print ("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func onSignin(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print ("Error: \(error?.localizedDescription)")

            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let parseConfig = ParseClientConfiguration {
            $0.applicationId = "5Q3ioIXQatNQ7ME3cV8LCqQwfnkklEuMsNBLER8c"
            $0.clientKey = "tDzUL4CRrfdtPR71LAum4NrPv2JJEkJUqPuyC3sQ"
            $0.server = "https://parseapi.back4app.com/parse"
        }
        Parse.initialize(with: parseConfig)
      }
        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
