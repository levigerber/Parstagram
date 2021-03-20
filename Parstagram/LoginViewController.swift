//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Levi Gerber on 3/20/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground:usernameField.text!, password:passwordField.text!) {
          (user: PFUser?, error: Error?) -> Void in
          if user != nil {
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
          } else {
            print("Login Error: \(error?.localizedDescription)")
          }
        }

    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text

        user.signUpInBackground {
          (succeeded: Bool, error: Error?) -> Void in
            if succeeded {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Signup Error: \(error?.localizedDescription)")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
