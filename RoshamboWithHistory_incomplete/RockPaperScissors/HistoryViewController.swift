//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Andres Kwan on 5/25/15.
//  Copyright (c) 2015 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    var history:[RPSMatch]!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("historyCell") as! UITableViewCell
        
        let match:RPSMatch =  self.history[indexPath.row]
        let player1:RPS    =  match.p1
        let player2:RPS    =  match.p2
        cell.detailTextLabel?.text = player1.description + " vs. " + player2.description

        
        cell.textLabel?.text = (player1 != match.loser) ? "Win!": "Loss."
        
        return cell;
    }
}
