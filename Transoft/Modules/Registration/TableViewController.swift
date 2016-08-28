//
//  TableViewController.swift
//  Transoft
//
//  Created by Anand Yadav on 07/08/16.
//  Copyright © 2016 Transoft. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var btnDocTypePassport: UIButton!
    @IBOutlet weak var btnDocTypeCI: UIButton!
    
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    var userInput: [String:Int] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolBar = UIToolbar().ToolbarPiker(#selector(self.dismissKeyboard))
        txtDate.inputAccessoryView = toolBar
        
        let gestureRecognizer : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(TableViewController.dismissKeyboard))
        self.view.addGestureRecognizer(gestureRecognizer)
        
        let datePickerView  : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        txtDate.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(TableViewController.handleDatePicker(_:)), forControlEvents: UIControlEvents.ValueChanged)


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 2
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
//
//        // Configure the cell...
//
//        return cell
//    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - TextField Delegate Methods
    func textFieldDidBeginEditing(textField: UITextField){
        if(textField.tag == 115){
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd MMM yyyy"
            textField.text = dateFormatter.stringFromDate(NSDate())
        }
        print("textFieldDidBeginEditing:",textField.text)

    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        print("textFieldShouldReturn:", textField.text)
        return false
    }
    
    func textFieldDidEndEditing(textField: UITextField){
        print("textFieldDidEndEditing:",textField.text)

    }
    
    @IBAction func calenderClicked(sender: AnyObject) {
        txtDate.becomeFirstResponder()
    }
    
    func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        txtDate.text = dateFormatter.stringFromDate(sender.date)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func radioButtonClicked(sender: AnyObject) {
        switch sender.tag {
        case 111, 112:
            if(sender.tag == 111){
                btnDocTypePassport.setImage(UIImage(named: "cb-checked"), forState: UIControlState.Normal)
                btnDocTypeCI.setImage(UIImage(named: "cb-unchecked"), forState: UIControlState.Normal)
            }else{
                btnDocTypePassport.setImage(UIImage(named: "cb-unchecked"), forState: UIControlState.Normal)
                btnDocTypeCI.setImage(UIImage(named: "cb-checked"), forState: UIControlState.Normal)
            }
            break
        case 113, 114:
            if(sender.tag == 113){
                btnMale.setImage(UIImage(named: "cb-checked"), forState: UIControlState.Normal)
                btnFemale.setImage(UIImage(named: "cb-unchecked"), forState: UIControlState.Normal)
            }else{
                btnMale.setImage(UIImage(named: "cb-unchecked"), forState: UIControlState.Normal)
                btnFemale.setImage(UIImage(named: "cb-checked"), forState: UIControlState.Normal)
            }
            break
        default:
            break
        }
    }
    

}
