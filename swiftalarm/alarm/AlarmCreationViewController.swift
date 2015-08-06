//
//  AlarmViewController.swift
//  alarm
//
//  Created by Chris Chares on 6/2/14.
//  Copyright (c) 2014 eunoia. All rights reserved.
//

import UIKit
import MediaPlayer
import CoreLocation

class AlarmCreationViewController: UITableViewController, MPMediaPickerControllerDelegate  {

    /*
    IBOutlets
    */
    @IBOutlet  var datePicker: UIDatePicker!
    @IBOutlet var titleLabel : UITextField?
    
    @IBOutlet var mapCell : UITableViewCell?
    @IBOutlet var mapCellLabel : UILabel?
    
    @IBOutlet var mediaCell : UITableViewCell?
    @IBOutlet var mediaImageView : UIImageView?

    /*
    Properties
    */
    
    var mediaItem:MPMediaItem?
    var region:CLCircularRegion?
    
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
        // Custom initialization
    }
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func cancel(sender : AnyObject) {
        
        navigationController!.presentingViewController!.dismissViewControllerAnimated(true, completion: {});
        
    }

    @IBAction func save(sender : AnyObject) {
        
        scheduleLocalNotificationWithData(indexOfObject: 1)
        if (  mediaItem == nil || titleLabel!.text.isEmpty ) {
            //validation failed
            return
        }
        
        var alarm = Alarm(title: titleLabel!.text, region: region!, media: mediaItem!)
  
        
        navigationController!.presentingViewController!.dismissViewControllerAnimated(true, completion: {
            
            let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appDelegate.addAlarm(alarm)
            
        });
    }

    func scheduleLocalNotificationWithData(indexOfObject atIndex : NSInteger){
        var localNotification = UILocalNotification ()
//        if(!localNotification)  怎么弄啊   oc里边的过来不对
//        {return}
        var dateFormatter=NSDateFormatter()
        dateFormatter.dateFormat="hh-mm -a"
        var date=dateFormatter.dateFromString(dateFormatter .stringFromDate(datePicker.date))
        localNotification.repeatInterval = NSCalendarUnit.CalendarCalendarUnit
       
        localNotification.fireDate=date;
        localNotification.alertBody="Alarm"
        localNotification.alertAction="Open App"
        localNotification.hasAction=true
        
        NSLog("%@", date!);
        var uidToStore=atIndex
        var userInfo=NSDictionary(object: uidToStore, forKey: "notificationId")
        localNotification.userInfo=userInfo as [NSObject : AnyObject]
        NSLog("uid store in userinfo%@", localNotification.userInfo!)
        UIApplication .sharedApplication().scheduleLocalNotification(localNotification)
    }
    /*
    #pragma mark - UITableViewDelegate
    */

    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
    
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if ( cell == mediaCell ) {
            
            let mediaPicker = MPMediaPickerController(mediaTypes: .AnyAudio)
            mediaPicker.delegate = self
            mediaPicker.prompt = "请选择一首曲"
            mediaPicker.allowsPickingMultipleItems = false
            presentViewController(mediaPicker, animated: true, completion: {})
            
        }
        
    }
    
  

    
    /*
    MPMediaPickerControllerDelegate
    */
    func mediaPicker(mediaPicker: MPMediaPickerController, didPickMediaItems  mediaItems:MPMediaItemCollection) -> Void
    {
        var aMediaItem = mediaItems.items[0] as! MPMediaItem
        if (( aMediaItem.artwork ) != nil) {
            mediaImageView!.image = aMediaItem.artwork.imageWithSize(mediaCell!.contentView.bounds.size);
            mediaImageView!.hidden = false;
        }
      
        self.mediaItem = aMediaItem;
        //fillData(aMediaItem);
        self.dismissViewControllerAnimated(true, completion: {});
    }
    
    func mediaPickerDidCancel(mediaPicker: MPMediaPickerController) {
        self.dismissViewControllerAnimated(true, completion: {});
    }
    
}
