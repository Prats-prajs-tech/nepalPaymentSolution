//
//  formViewController.swift
//  solution_assesment
//
//  Created by pratik on 11/06/2022.
//

import UIKit

class formViewController: UIViewController {

       // This variable will hold the data being passed from the First View Controller
    var receivedString = "" // name
    var choice = "" // choice of course
    var formimage : UIImage!
    var formsalary = ""
    var formdays : Int = 0
    @IBOutlet weak var mainLabel: UILabel!
   
    @IBOutlet weak var formchoice: UILabel!
    @IBOutlet weak var formSalary: UILabel!
    
    @IBOutlet weak var formDays: UILabel!
    @IBOutlet weak var imageshow: UIImageView!
    
    
    
       override func viewDidLoad() {
           super.viewDidLoad()

           // Used the text from the First View Controller to set the label
           mainLabel.text = receivedString
           formchoice.text = choice
           imageshow.image = formimage
           formSalary.text = formsalary
           formDays.text = String(formdays)
       }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
   
    @IBAction func goback(seque: UIStoryboardSegue )
    {
        print("went back . section not cleared")
    }
}
