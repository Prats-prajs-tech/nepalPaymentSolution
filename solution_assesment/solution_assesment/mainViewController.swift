//
//  ViewController.swift
//  solution_assesment
//
//  Created by pratik on 11/06/2022.
//

import UIKit

class mainViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var Textarea: UITextField!
    
    @IBOutlet weak var salaryviewer: UILabel!
    
    @IBOutlet weak var workingdays: UILabel!
    //textarea for ****
    
    @IBOutlet weak var ios: UISwitch!
    
    @IBOutlet weak var android: UISwitch!
    var globalImage: UIImage?
    var mainsalary: String?
    var maindays : Int?
    @IBOutlet weak var mainimage: UIImageView!
    @IBAction func switchchange(_ sender: Any) {
        if ios.isOn {
            android.setOn(false, animated: true)
        }
    }
    
    @IBAction func imageupload(_ sender: Any) { // for image upload
        let vc = UIImagePickerController()
            vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc , animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")]as? UIImage {
  mainimage.image = image
            globalImage = image

}
        picker.dismiss(animated: true , completion: nil)

    }
  
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true , completion: nil)
    }
    
    
    @IBAction func androidswitchchanger(_ sender: Any) {
        if android.isOn {
            ios.setOn(false, animated: true)
        }
    }
    
 //BUTTON
    @IBAction func nextScreenPressed(_ sender: UIButton) { // click Button to call  performseque function
        performSegue(withIdentifier: "goToNext", sender: self) // calling seque 
        
    }

    
    //SLIDER
    @IBAction func formsalary(_ sender: UISlider) {
        
        let salary = sender.value
        salaryviewer.text = String(salary)
        mainsalary = String(salary)
    }
    
    //uistepper
    @IBAction func workingDays(_ sender: UIStepper) {
        let days : Int = Int(sender.value)
        workingdays.text = String(days)
        maindays = days
    }
    
    
    //reset dustbin
    @IBOutlet weak var reset: UIImageView!
    
   
    
    @objc func  imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        Textarea.text = ""
        salaryviewer.text = ""
        workingdays.text = ""
        mainsalary = ""
        maindays = 0
        android.setOn(false, animated: true)
        ios.setOn(false, animated: true)

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        reset.isUserInteractionEnabled = true
        reset.addGestureRecognizer(tap)
    }
    
        override func prepare(for seque: UIStoryboardSegue, sender: Any?){
            if seque.identifier == "goToNext" {
                let destinationVC = seque.destination as? formViewController
                if let name = Textarea.text{
                    destinationVC?.receivedString = name ;

                }
                if mainsalary != nil
                {
                    destinationVC?.formsalary = mainsalary!
                }
                
                if maindays != nil
                {
                    destinationVC?.formdays = maindays!
                }
                
                if ios.isOn
                {
                    destinationVC?.choice = "ios" ;
                   
                }
                if android.isOn
                {
                    destinationVC?.choice = "android" ;
                }
                if ((globalImage) != nil)
                {
                    destinationVC?.formimage = globalImage
                    
                }
              
                
            }
    }
    
    

    @IBAction func goback(seque: UIStoryboardSegue )
    {
        print("went back . section not cleared")
    }
    
   
}

