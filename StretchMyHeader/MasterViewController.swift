//
//  MasterViewController.swift
//  StretchMyHeader
//
//  Created by Samer Rohani on 2015-11-24.
//  Copyright © 2015 Samer Rohani. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [AnyObject]()
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
        
        let world: NewsItem = NewsItem(category: NewsItem.Category.World, headline: "Climate change protests, divestments meet fossil fuels realities")
        let africa: NewsItem = NewsItem(category: NewsItem.Category.Africa, headline: "Climate change protests, divestments meet fossil fuels realities")
        let europe: NewsItem = NewsItem(category: NewsItem.Category.Europe, headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'")
        let middleeast: NewsItem = NewsItem(category: NewsItem.Category.MiddleEast, headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible")
        let asiapacific: NewsItem = NewsItem(category: NewsItem.Category.AsiaPacific, headline: "Despite UN ruling, Japan seeks backing for whale hunting")
        let americas: NewsItem = NewsItem(category: NewsItem.Category.Americas, headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria")
        let world2: NewsItem = NewsItem(category: NewsItem.Category.World, headline: "South Africa in $40 billion deal for Russian nuclear reactors")
        let europe2: NewsItem = NewsItem(category: NewsItem.Category.Europe, headline: "'One million babies' created by EU student exchanges")
        objects = [world, africa, europe, middleeast, asiapacific, americas, world2, europe2]
        
        
        

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
        objects.insert(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! NSDate
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! HeadlineTableViewCell

        let object = objects[indexPath.row]
        
        cell.category.text = object.category
        cell.headline.text = object.
        
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

