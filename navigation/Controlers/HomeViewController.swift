//
//  ViewController.swift
//  navigation
//
//  Created by test1 on 2/18/20.
//  Copyright © 2020 test1. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var tv: UITableView!  // the category
    
    
    let transition = SlideInTransition()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tv.delegate = self
        tv.dataSource = self
    }
    
    //both bring the data out on the tableview
    override func didReceiveMemoryWarning() {
         super.didReceiveMemoryWarning()
     }
     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(true)
         DataService.instance.fetchAllCategories { (success) in
             if success {
                 self.tv.reloadData()
             }
         }
     }
     // show categories
    @IBAction func CategoryPressed(_ sender: Any) {
        self.tv.isHidden = false
    }
    
    
    @IBAction func DidTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(identifier: "MenuViewControlller") else {return}
        
        
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController,animated: true)
    }
    
}

extension HomeViewController : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
        
}

// Extention for catgeories slideDown menu
extension HomeViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(DataService.instance.categories.count)
        return DataService.instance.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = DataService.instance.categories[indexPath.row].categoryName
        print(cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    
}
