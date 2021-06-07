//
//  NewPlaceViewController.swift
//  MyMapsPlace
//
//  Created by Danya on 06.06.2021.
//

import UIKit

class NewPlaceViewController: UITableViewController, UINavigationControllerDelegate {
    
    
    
    var newPlace = Place()
    var imageIsChanged = false

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeName: UITextField!
    @IBOutlet weak var placeLocation: UITextField!
    @IBOutlet weak var placeType: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        saveButton.isEnabled = false
        
        placeName.addTarget(self, action: #selector(textFieldChanget), for: .editingChanged)
      
    }


//MARK: - Tabel view delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let cameraIcon = #imageLiteral(resourceName: "camera")
            let photoIcon = #imageLiteral(resourceName: "photo")
            
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Камера", style: .default) { _ in
                self.chooseImagePicker(sorce: .camera)
            }
            camera.setValue(cameraIcon, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let photo = UIAlertAction(title: "Фото", style: .default) { _ in
                self.chooseImagePicker(sorce: .photoLibrary)
            }
            photo.setValue(photoIcon, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            present(actionSheet, animated: true, completion: nil)
            
        } else {
            view.endEditing(true)
        }
    }

    func saveNewPlace() {
        
        var image: UIImage?
        
        if imageIsChanged {
            image = placeImage.image
        } else {
            image = #imageLiteral(resourceName: "nillNewPlace")
        }
        
//        newPlace = Place(name: placeName.text!,
//                         location: placeLocation.text,
//                         type: placeType.text,
//                         image: image,
//                         restaurantImage: nil)
    }
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
//MARK: - Text field delegate

extension NewPlaceViewController: UITextFieldDelegate {
    //Скрываем клавиатуру по нажатию Done
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func textFieldChanget() {
               
        if placeName.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
        
           }
}

//MARK: - работа с изображениями
extension NewPlaceViewController: UIImagePickerControllerDelegate {
    
    func chooseImagePicker(sorce: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(sorce) {
            
            let imegePicker = UIImagePickerController()
            imegePicker.delegate = self
            imegePicker.allowsEditing = true
            imegePicker.sourceType = sorce
            present(imegePicker, animated: true, completion: nil)
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        placeImage.image = info[.editedImage] as? UIImage
        placeImage.contentMode = .scaleAspectFill
        placeImage.clipsToBounds = true
        
        imageIsChanged = true
        
        dismiss(animated: true, completion: nil)
        
    }
}
