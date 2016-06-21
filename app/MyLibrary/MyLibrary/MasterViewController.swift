//
//  MasterViewController.swift
//  MyLibrary
//
//  Created by Mastere 1 IT on 21/06/2016.
//  Copyright © 2016 triforce. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    
/*****************************************/
//    var objects = [AnyObject]()
    var objects = NSMutableArray()
    var myBookStore: BookStore = BookStore()
/*****************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

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
        //objects.insert(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //quand je clique dans une cellule pour afficher le detail
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
/*****************************************/
                //let object = objects[indexPath.row] as! NSDate
                let selectedBook:Book = myBookStore.books[indexPath.row] //je vais chercher le livre sur lequel on a cliqué et je le donne à mon detail
/*****************************************/
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                
/*****************************************/
//                controller.detailItem = object
                  controller.detailItem = selectedBook
/*****************************************/
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
/*****************************************/
        return 1 //nombre de section //la j'ai une seule section où je vais afficher tous mes livres donc 1
/*****************************************/
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
/*****************************************/
        //return objects.count //retourne le nombre de ligne dans la section courante
        return myBookStore.books.count //myBookStore.books renvoie la liste des books de la library
/*****************************************/
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) //on dessine la cellule correspondant à la ligne
/*****************************************/
        //let object = objects[indexPath.row] as! NSDate //il va cherche l'objet qui correspond à la cellule qui nous interesse pour afficher chaque livre
        let book = myBookStore.books[indexPath.row]
        cell.textLabel!.text = book.title //on prend la description de la cellule
/*****************************************/
        return cell //on renvoie tout ça
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    
    //NSIndexPath a section qui renvoie un Int et row qui renvoie un Int
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            //objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

