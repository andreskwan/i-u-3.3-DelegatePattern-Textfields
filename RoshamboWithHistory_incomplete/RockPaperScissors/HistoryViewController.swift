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
        
        cell.detailTextLabel?.text = match.winner.description + " vs. " + match.loser.description
        let player1:RPS    =  match.p1
        
        cell.textLabel?.text = (player1 == match.winner) ? "Win!": "Loss."
        
        return cell;
    }
}
