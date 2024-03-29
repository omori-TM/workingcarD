//
//  CategoryViewController.swift
//  WorkingCar
//
//  Created by 森尻尭之 on 2016/07/08.
//  Copyright © 2016年 Takayuki Morijiri. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    let tableview: UITableView = UITableView()
    var car_List:[NSDictionary] = []
    var selectedIndex = -1
    var selectedCategory = ""
    var selectedName = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn_back = UIBarButtonItem()
        btn_back.title = ""
        self.navigationItem.backBarButtonItem = btn_back
        
        tableview.frame = CGRectMake(0, 0, 320, 500)
        tableview.delegate   = self
        tableview.dataSource = self
        tableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableview)
        
        let views = ["Table":tableview]
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[Table]-0-|", options: [], metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[Table]-0-|", options: [], metrics: nil, views: views))

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        let path = NSBundle.mainBundle().pathForResource("json", ofType: "")
        let jsondata = NSData(contentsOfFile: path!)
        
        let jsonArray = (try! NSJSONSerialization.JSONObjectWithData(jsondata!, options: [])) as! NSArray
        
        for data in jsonArray {
            if data["category"] as! Int == selectedIndex {
                print("\(data["name"])")
                car_List.append(data as! NSDictionary)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return self.car_List.count
    }
    
    func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath:indexPath) as UITableViewCell
        
        let workingName = car_List[indexPath.row]["name"] as! String
        
        cell.textLabel?.text = "\(workingName)"
        
        
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detailVC:DetailViewController = DetailViewController()
        self.navigationController!.pushViewController(detailVC, animated: true)
                
        selectedName = car_List[indexPath.row]["name"] as! String
        detailVC.selectedName = selectedName
        
        print("\(indexPath.row)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
