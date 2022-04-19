//
//  TutorialPageContentHolderViewController.swift
//  StartUpTutorialScreens
//
//  Created by Eclectics on 19/04/2022.
//

import UIKit

class TutorialPageContentHolderViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    var imageFileName: String!
    var pageIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myImageView.image = UIImage(named: imageFileName)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
