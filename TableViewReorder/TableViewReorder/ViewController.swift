//
//  ViewController.swift
//  TableViewReorder
//
//  Created by Manasa on 26/03/21.
//  Copyright © 2021 Manasa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet var tableView: UITableView! //TableView Outlet
    var numbers = [1,2,3,4,5].shuffled()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isEditing = true
    }
    
    
    
    
    
  // methods to reorder(swap) reload rows in table view
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    

     func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    
     numbers.swapAt(sourceIndexPath.row, destinationIndexPath.row)
     tableView.reloadData()
     
     }
    
    
    
    
    //method to return number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
           return numbers.count
           
       }
    
    
    
    
    //method to display content in each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = String(numbers[indexPath.row])
    cell.textLabel?.font = UIFont(name: "Arial", size: 70)
    cell.textLabel?.textColor = .white
    cell.textLabel?.textAlignment = .center
        
        var number = numbers[indexPath.row] // to store the number at paticular row
              // print(number)
               
               
               if ((indexPath.row != 0) && (indexPath.row != 4)) //condition for all rows other than top row and bottom row

               {
                   
                if ( number+1 == numbers[indexPath.row+1] && number-1 == numbers[indexPath.row-1 ] ){
                       //print("Green")
                       cell.backgroundColor = .green
                   }else if ( number+1 == numbers[indexPath.row+1] || number-1 == numbers[indexPath.row-1 ] ){
                       //print("Yellow")
                       cell.backgroundColor = .yellow

                   }else {
                       //print("Red")
                       cell.backgroundColor = .red

                   }
                   
               } else if (indexPath.row == 0)//condition for top row
               {
                              
                              if ( number+1 == numbers[indexPath.row+1] ) {
                                  
                                  //print("Green")
                                  cell.backgroundColor = .green

                              } else {
                                  //print("Red")
                                  cell.backgroundColor = .red

                              }
               }else//condition for last row
               {
                              if (number-1 == numbers[indexPath.row-1] ){
                                  //print("Green")
                                  cell.backgroundColor = .green

                              } else {
                                  //print("Red")
                                  cell.backgroundColor = .red

                          }
                      }
        
            return cell

    }

}

