//
//  ViewController.swift
//  TipCalculatorPrework
//
//  Created by Colleen Ponraj on 1/23/21.
//

import UIKit

import CoreSpotlight
import MobileCoreServices


class ViewController: UIViewController,UIActionSheetDelegate {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var billAmountLabel: UILabel!

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingButton: UIBarButtonItem!
    
    @IBOutlet weak var ltipAmountLabel: UILabel!
    
    @IBOutlet weak var lbillAmountLabel: UILabel!

    @IBOutlet weak var ltotalLabel: UILabel!
    
    @IBOutlet weak var mailButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
       
        self.title = "Tip Calculator"
        
     
      

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
               super.viewWillAppear(animated)
               
       
        let bill = Double(billAmountTextField.text!) ?? 0
        //Use locale specific currency and currency thousands separator.
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        
        formatter.locale = Locale.current
        
        
        billAmountTextField.placeholder = formatter.string(from: NSNumber(value: bill))
        
        
        billAmountTextField.textColor = Style.textColor
    
        tipAmountLabel.textColor = Style.textColor
        billAmountLabel.textColor = Style.textColor
        totalLabel.textColor = Style.textColor
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:Style.textColor]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
       
        UIView.animate(withDuration: 1) { [self] in
            changeColor()

            
        }
       
       
        let defaults = UserDefaults.standard

        let mode = defaults.bool(forKey: "Mode")

        let rootViewController: UINavigationController?
        rootViewController = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.rootViewController as? UINavigationController

        if mode {
          
            self.navigationController?.overrideUserInterfaceStyle = .dark
            rootViewController?.navigationController?.overrideUserInterfaceStyle = .dark
            
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.overrideUserInterfaceStyle = .dark

           
        }else{
            self.navigationController?.overrideUserInterfaceStyle = .light
            rootViewController?.navigationController?.overrideUserInterfaceStyle = .light
            
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.overrideUserInterfaceStyle = .light


        }
        
        tipControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:Style.textColor],
                                                    for: .normal)
        
        tipControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:Style.textColor],
                                                    for: .selected)
        
        
        
       

           }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Make sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.
        billAmountTextField.becomeFirstResponder()
    }
    
    func updateFontSize()  {
        
        let defaults = UserDefaults.standard


        let mode = defaults.integer(forKey: "Font")

        switch mode {
        case 0:
            tipAmountLabel.font = Style.smallFont()
            billAmountLabel.font = Style.smallFont()
            totalLabel.font = Style.smallFont()

           
            ltipAmountLabel.font = Style.smallFont()
            lbillAmountLabel.font = Style.smallFont()
            ltotalLabel.font = Style.smallFont()
            
            mailButton.titleLabel?.font = Style.smallFont()
            
          
            
//            let font: [AnyHashable : Any] = [NSAttributedString.Key.font : Style.smallFont()]
//            tipControl.setTitleTextAttributes(font, for: .normal)
            
            //let font = UIFont.systemFont(ofSize: 16)
            tipControl.setTitleTextAttributes([NSAttributedString.Key.font: Style.smallFont(),NSAttributedString.Key.foregroundColor:Style.textColor],
                                                        for: .normal)
            
            
            break
        case 1:
            tipAmountLabel.font = Style.mediumFont()
            billAmountLabel.font = Style.mediumFont()
            totalLabel.font = Style.mediumFont()
            
            ltipAmountLabel.font = Style.mediumFont()
            lbillAmountLabel.font = Style.mediumFont()
            ltotalLabel.font = Style.mediumFont()

            mailButton.titleLabel?.font = Style.mediumFont()
            let attr = NSDictionary(object: Style.mediumFont(), forKey: NSAttributedString.Key.font as NSCopying)
//            let font: [AnyHashable : Any] = [NSAttributedString.Key.font : Style.mediumFont()]
//            tipControl.setTitleTextAttributes(font, for: .normal)
            
            
            tipControl.setTitleTextAttributes([NSAttributedString.Key.font: Style.mediumFont(),NSAttributedString.Key.foregroundColor:Style.textColor],
                                                        for: .normal)

            break
        case 2:

            tipAmountLabel.font = Style.largeFont()
            billAmountLabel.font = Style.largeFont()
            totalLabel.font = Style.largeFont()
            
            ltipAmountLabel.font = Style.largeFont()
            lbillAmountLabel.font = Style.largeFont()
            
            ltotalLabel.font = Style.largeFont()
            
            mailButton.titleLabel?.font = Style.largeFont()
//            let font: [AnyHashable : Any] = [NSAttributedString.Key.font : Style.largeFont()]
//            tipControl.setTitleTextAttributes(font, for: .normal)

            tipControl.setTitleTextAttributes([NSAttributedString.Key.font: Style.largeFont(),NSAttributedString.Key.foregroundColor:Style.textColor],
                                                        for: .normal)
            break

        default:
            break
        }
        
    }
    func changeColor()  {
        let defaults = UserDefaults.standard
        
        let theme = defaults.integer(forKey: "Theme")
        switch theme {
        case 0:
            self.view.backgroundColor = Style.BGColor
            
                self.navigationController?.navigationBar.barTintColor  = Style.BGColor
            UINavigationBar.appearance().barTintColor = Style.BGColor
            UINavigationBar.appearance().tintColor = Style.BGColor


            break
        case 1:
            self.view.backgroundColor = Style.BGColorBlue
            self.navigationController?.navigationBar.barTintColor  = Style.BGColorBlue
            UINavigationBar.appearance().barTintColor = Style.BGColorBlue
            UINavigationBar.appearance().tintColor = Style.BGColorBlue

            break
        case 2:
            self.view.backgroundColor = Style.BGColorPink
            self.navigationController?.navigationBar.barTintColor  = Style.BGColorPink
            UINavigationBar.appearance().barTintColor = Style.BGColorPink
            UINavigationBar.appearance().tintColor = Style.BGColorPink

            break
        case 3:
            self.view.backgroundColor = Style.BGColorPurple
            self.navigationController?.navigationBar.barTintColor  = Style.BGColorPurple
            UINavigationBar.appearance().barTintColor = Style.BGColorPurple
            UINavigationBar.appearance().tintColor = Style.BGColorPurple

            break
        default:
            break
        }
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        
        
        
        
        
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        //Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
     
        updateAmount(tip: tip)

        
    }
    

    @IBAction func sendMail(_ sender: Any) {
        
        let alert = UIAlertController(title: "", message: "Send an email of the total bill amount?", preferredStyle: .actionSheet)
        alert.view.tintColor = Style.textColor

        alert.addAction(UIAlertAction(title: "Request \(tipAmountLabel.text!) from a friend", style: .default , handler:{ (UIAlertAction)in
                print("User click Approve button")
            }))
            
        alert.addAction(UIAlertAction(title: "Email myself that I Owe \(tipAmountLabel.text!)", style: .default , handler:{ (UIAlertAction)in
                print("User click mail button")
                
            }))

        
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
                print("User click Dismiss button")
            }))

        
            self.present(alert, animated: true, completion: {
                print("completion block")
            })
        
        }
    
   
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        let currentValue = Double(sender.value)
        let tipPercentages = Double(currentValue/100)
        let tip = bill * tipPercentages

        
        updateAmount(tip: tip)
        
    }
    
    func updateAmount(tip:Double)  {
        
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        
        formatter.locale = Locale.current
        
        
        billAmountLabel.text = formatter.string(from: NSNumber(value: bill))
        
        let tipValue = tip
        
        let total = bill + Double(tipValue)
        
        //Update Tip Amount label
        tipAmountLabel.text = formatter.string(from: NSNumber(value: tipValue))
        
       

        let totalAmount = formatter.string(from: NSNumber(value: total))
        // Example result: $1,234,567
        
        
        //Update Total Amount
        totalLabel.text = totalAmount
        indexItem(title: "Bill Amount : \(totalLabel.text!)", desc: "Tip Calculator", identifier: "com.colleen.Tip")

    }
   
    
    
     @IBAction  func changeFontSize()  {
        
        let defaults = UserDefaults.standard

        let alert = UIAlertController(title: "", message: "Select Font Size", preferredStyle: .actionSheet)
        alert.view.tintColor = Style.textColor

               alert.addAction(UIAlertAction(title: "Small", style: .default , handler:{ (UIAlertAction)in
                
                defaults.set(0, forKey: "Font")
                defaults.synchronize()



                             self.updateFontSize()
                
               }))
        
        alert.addAction(UIAlertAction(title: "Medium", style: .default , handler:{ (UIAlertAction)in
            defaults.set(1, forKey: "Font")
            defaults.synchronize()

            UIView.animate(withDuration: 1) { [self] in

                         self.updateFontSize()
            }

        }))
        alert.addAction(UIAlertAction(title: "Large", style: .default , handler:{ (UIAlertAction)in
            defaults.set(2, forKey: "Font")
            defaults.synchronize()

            UIView.animate(withDuration: 1) { [self] in

                         self.updateFontSize()
            }
        }))
                   
        
                  alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
                      print("User click Dismiss button")
                  }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    //  Remember the bill amount across app restarts. After an extended period of time, clear the state. This is a UI trick that Apple uses with the Spotlight app. If you return there a minute later, it will show your most recent search. if you return 10 minutes later, it defaults to blank. To implement this, plug into the application lifecycle and track time using NSDate.
    func indexItem(title: String, desc: String, identifier: String) {
        let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
        attributeSet.title = title
        attributeSet.contentDescription = desc
        
        attributeSet.keywords = ["Tips","Calculator","Tippy","Bill Amount"]

        let item = CSSearchableItem(uniqueIdentifier: "\(identifier)", domainIdentifier: "com.colleen", attributeSet: attributeSet)
        CSSearchableIndex.default().indexSearchableItems([item]) { error in
            if let error = error {
                print("Indexing error: \(error.localizedDescription)")
            } else {
                print("Search item successfully indexed!")
            }
        }
    }
    
}

