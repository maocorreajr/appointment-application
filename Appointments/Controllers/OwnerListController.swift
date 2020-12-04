//
//  ProfessorListController.swift
//  COPApp
//
//  Updates by Julian Mauricio Correa on 12/2/20.
//  Copyright © 2020 Julian Mauricio Correa. All rights reserved.
//

import UIKit
import Firebase

class OwnerListController: UIViewController {

    //MARK:- IBOutlets
    
    @IBOutlet weak var ownerListTableView: UITableView!
    
    @IBOutlet weak var topNavigationBar: UINavigationItem!
    
    //MARK:- Global variable
    let db = Firestore.firestore()
    var owners: [Owner] = []
    var documents : [DocumentSnapshot] = []
    var customer = Customer()
    var owner = Owner()
    var userType = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topNavigationBar.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        topNavigationBar.backBarButtonItem?.tintColor = UIColor.white
        ownerListTableView.delegate = self
        ownerListTableView.dataSource = self
        
        ownerListTableView.register(UINib(nibName: "OwnerCell", bundle: nil), forCellReuseIdentifier: "OwnerCell")
        ownerListTableView.allowsSelection = true
        ownerListTableView.rowHeight = 246
        ownerListTableView.backgroundColor = UIColor(colorWithHexValue: 0xF0F0F0)
        ownerListTableView.separatorStyle = .none
        
        getProfessorListQuery()

    }
    
    //MARK:- Get Professor list Query
    func getProfessorListQuery() {
        db.collection("Owners").getDocuments { (querySnapshot, error) in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshot result: \(String(describing: error))")
                return
            }
            
            let models = snapshot.documents.map({ (document) -> Owner in
                
                print("Documents.data(): ", document.data())
                if let model = Owner(dictionary: document.data()) {
                    return model
                } else {
                    print("Unable to initialize \(Appointment.self) with document data \(document.data())")
                    return Owner()
                }
            })
            
            self.owners = models
            print("Professors: \n", self.owners)
            self.documents = snapshot.documents
            print("Documents: ", self.documents)
            self.ownerListTableView.reloadData()
        }
    }
    
    //MARK:- Prepare For Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToProfessorSchedule" {
            guard let indexPath = ownerListTableView.indexPathForSelectedRow else {
                return
            }
            if let destinationVC = segue.destination as? CalendarKitMainController {
                destinationVC.owner = owners[indexPath.row]
                destinationVC.customer = customer
                destinationVC.userType = userType
                destinationVC.owner = owner
            }
        }
    }

}

extension OwnerListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return owners.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ownerListTableView.dequeueReusableCell(withIdentifier: "OwnerCell", for: indexPath) as! OwnerCell
        cell.ownerNameLabel.text = "\(owners[indexPath.row].firstName) \(owners[indexPath.row].lastName), \(owners[indexPath.row].emailId)"
        cell.ownerDesignationLabel.text = "\(owners[indexPath.row].phoneNumber)"
        
        let profPictureStorageRef = Storage.storage().reference().child("professor/\(owners[indexPath.row].lastName).jpg")
        profPictureStorageRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
            if let error = error {
                print("Error downloading the image: \(error)")
            } else {
                let image = UIImage(data: data!)
                cell.pictureImageView.image = image
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToProfessorSchedule", sender: self)
        ownerListTableView.deselectRow(at: indexPath, animated: true)
        
    }
}
