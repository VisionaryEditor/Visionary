//
//  NewProject.swift
//  Visionary
//
//  Created by Silverstar A. Carlson on 22/09/2024.
//

import UIKit

class NewProject: UIViewController {
    @IBOutlet var picker: UIPickerView!; let pixelSetter = 8...8192; let fpsSetter = 1...240
    override func viewDidLoad() { super.viewDidLoad(); picker.dataSource = self; picker.delegate = self }
}

extension NewProject: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { return 3 }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { return 240 }
}

extension NewProject: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { return "number here" }
}
