//
//  ShareViewController.swift
//  DemoShareExtension
//
//  Created by Piyush on 7/14/16.
//  Copyright © 2016 Kahuna Systems. All rights reserved.
//

import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        
        if let content = extensionContext!.inputItems[0] as? NSExtensionItem {
            
            if let inputedText = content.attributedContentText {
                
                let textString = inputedText.string
                
                if textString.characters.count > 10{
                    return false
                }
            }

        }
        
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        self.extensionContext!.completeRequestReturningItems([], completionHandler: nil)
    }

    override func configurationItems() -> [AnyObject]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}
