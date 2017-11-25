//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by MacStudent on 2017-11-16.
//  Copyright © 2017 MacStudent. All rights reserved.

// currency-calculator project


//
//
//
//
//********************************//
//NAme: NANCY SHARMA(C0710136)
//      Arshdeep Singh(c0710012)

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var myValues:Double = 0;
    var myValues2:Double = 0;
    var myValues3:Double = 0;
     var myValues4:Double = 0;
    var myValues8:Double = 0;
    var myValues7:Double = 0;
    var myValues6:[Double] = []
    var myCurrency:[String] = []
    var myValues5:[Double] = []
    
    var activeCurrency:Double = 0;
    var activeCurrency2:Double = 0;
    

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return myCurrency.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return myCurrency[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        activeCurrency = myValues6[row]
    }

    
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var output2: UILabel!
    @IBOutlet weak var output3: UILabel!
    @IBOutlet weak var output4: UILabel!
    
    @IBOutlet weak var output5: UILabel!
    @IBOutlet weak var output6: UILabel!
    
    
    @IBOutlet weak var output7: UILabel!
    @IBAction func action(_ sender: AnyObject) {
        if (input.text != "")
        {
            output.text = "\(String(Double(input.text!)! * myValues)) USD"
            output2.text = "\(String(Double(input.text!)! * myValues2)) INR"
            output3.text = "\(String(Double(input.text!)! * myValues3)) BGN"
            output4.text = String(Double(input.text!)! * activeCurrency)
        
            
            output5.text = "\(String(Double(input.text!)! * myValues4)) USD"
            output6.text = "\(String(Double(input.text!)! * myValues8)) INR"
            output7.text = "\(String(Double(input.text!)! * myValues7)) BGN"
            
            
            
           
        }
        
           }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let urlString = "https://api.fixer.io/latest?base=CAD"
       
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil
            {
                print ("ERROR")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:AnyObject]
                        if let rates = myJson["rates"] as? NSDictionary
                        {
                            for (key, value) in rates
                            {
                                self.myCurrency.append((key as? String)!)
                                self.myValues6.append((value as? Double)!)
                            }
                        }
                        let x = myJson["rates"]!
                        
                        
                        let usd = x["USD"] as? Double
                        self.myValues = usd!
                        
                        let inr = x["INR"] as? Double
                        self.myValues2 = inr!
                        
                        let aed = x["BGN"] as? Double
                        self.myValues3 = aed!
                        
                    }
                    catch
                    {
                        
                    }
                }
            }
            self.pickerView.reloadAllComponents()
        }
        task.resume()
        
        let urlString2 = "https://api.fixer.io/2017-11-15"
        
        let url2 = URL(string: urlString2)
        let task2 = URLSession.shared.dataTask(with: url2!) { (data, response, error) in
            
            if error != nil
            {
                print ("ERROR")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:AnyObject]
                       
                        let x = myJson["rates"]!
                        
                        
                        let usd = x["USD"] as? Double
                        self.myValues4 = usd!
                        
                        let inr = x["INR"] as? Double
                        self.myValues8 = inr!
                        
                        let eur = x["BGN"] as? Double
                        self.myValues7 = eur!
                        
                    }
                    catch
                    {
                        
                    }
                }
            }
            self.pickerView.reloadAllComponents()
        }
        task2.resume()

        
        
        
        
    }

        
        



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    
    
    
    

}

