//
//  addPackageTableViewController.swift
//  PackageTrackingApp 1.0
//
//  Created by Jayden Patterson on 2021/12/20.
//

import UIKit

class addPackageTableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var addressField: UITextField!
    @IBOutlet var deliveryDatePickerLabel: UILabel!
    @IBOutlet var deliveryDatePicker: UIDatePicker!
    @IBOutlet var statusPicker: UIPickerView!
    @IBOutlet var trackingNumberLabel: UITableViewCell!
    @IBOutlet var notesTextView: UITextView!
    
    let statusArray = ["Packaging", "Dispatched", "En-Route", "Delivered"]
    
    var statusSave: PackageStatus?
    init?(coder: NSCoder, statusSave: PackageStatus?) {
        self.statusSave = statusSave
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let midnightToday = Calendar.current.startOfDay(for: Date())
        deliveryDatePicker.minimumDate = midnightToday
        deliveryDatePicker.date = midnightToday
        
        statusPicker.dataSource = self
        statusPicker.delegate = self
        
        updateDateViews()
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return statusArray.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return statusArray[row]
}
    
    let deliveryDatePickerCellIndexPath = IndexPath(row: 1, section: 2)
    let deliveryDatePickerLabelCellIndexPath = IndexPath(row: 0, section: 2)
    
    func updateDateViews(){
        deliveryDatePicker.minimumDate = Calendar.current.date(byAdding:.day, value: 1, to: deliveryDatePicker.date)
   
        deliveryDatePickerLabel.text = dateFormatter.string(from:
           deliveryDatePicker.date)
        
    }
    func updateSaveButtonState() {
        let nameText = nameField.text ?? ""
        let addressText = addressField.text ?? ""
        let statusText = statusPicker.description ?? ""
    }
    
    override func prepare(for segue: UIStoryboardSegue,
       sender: Any?) {
    
        guard segue.identifier == "saveUnwind" else { return }
    
        let deliveryName = nameField.text ?? ""
        let deliveryAddress = addressField.text ?? ""
        let status = statusPicker.description
        
        statusSave = PackageStatus(name: deliveryName, address: deliveryAddress, status: status)
    }
    var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        return dateFormatter
    }()
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    @IBAction func saveBarButtonTapped(_ sender: UIBarButtonItem) {
        let deliveryName = nameField.text ?? ""
        let deliveryAddress = addressField.text ?? ""
        let notesSection = notesTextView.text ?? ""
        updateDateViews()
    }
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }


}

    

