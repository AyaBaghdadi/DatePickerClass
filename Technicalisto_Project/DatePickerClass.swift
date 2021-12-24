
///-----------------------------------------------------------------------------------------------
//  Created by Aya Baghdadi.
//  Copyright © 2021 Technicalisto . All rights reserved.
///-----------------------------------------------------------------------------------------------

import Foundation
import UIKit

class DatePickerClass: UITextField , UITextFieldDelegate {

    var datePicker:UIDatePicker!

    ///-----------------------------------------------------------------------------------------------
    /// UITextFieldDelegate & awakeFromNib
    ///-----------------------------------------------------------------------------------------------

    open override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.showDatePicker()
    }
    
    ///-----------------------------------------------------------------------------------------------
    /// showDatePicker
    ///-----------------------------------------------------------------------------------------------

    func showDatePicker(){
        
        datePicker = UIDatePicker()

        datePicker.datePickerMode = .date
        
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .inline
        }
        
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: NSLocalizedString("End", comment: ""), style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: NSLocalizedString("Cancel", comment: ""), style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        self.inputAccessoryView = toolbar
        self.inputView = datePicker
        
        }
        
    @objc func donedatePicker(){
            
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd/MM/yyyy"
        
        self.text = formatter.string(from: datePicker.date)
        
        self.endEditing(true)
        
    }
        
    @objc func cancelDatePicker(){
        self.endEditing(true)
    }
}
