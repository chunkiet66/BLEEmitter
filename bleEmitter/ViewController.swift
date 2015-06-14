//
//  ViewController.swift
//  bleEmitter
//
//  Created by Kang Shiang on 2015-06-14.
//  Copyright (c) 2015 Lex. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBPeripheralManagerDelegate {
    @IBOutlet var mylabel: UILabel!
    
    let uuid = NSUUID(UUIDString: "0CF052C2-97CA-407C-84F8-B62AAC4E9020")
    var data: NSDictionary = ["data":"hihi"]
    var peripheralManager = CBPeripheralManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.peripheralManager = CBPeripheralManager(delegate: self, queue: nil, options: nil)
        mylabel.text = "starting service"
        
    }
    
    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager!) {
        if(peripheral.state == CBPeripheralManagerState.PoweredOn){
            self.peripheralManager.startAdvertising(nil)
            mylabel.text = "bluetooth is on"
        }else{
            
        }
    }
    
    func peripheralManagerDidStartAdvertising(peripheral: CBPeripheralManager!, error: NSError!) {
        mylabel.text = "start advertising now"
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

