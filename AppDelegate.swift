//
//  AppDelegate.swift
//  Rapid Fire
//
//  Created by MCA 2 on 13/10/18.
//  Copyright © 2018 stratecore. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import GoogleSignIn
import IQKeyboardManagerSwift
import AVFoundation
import PhotosUI
import Speech
import InAppPurchase
import CloudKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //DECLARATION VARIABLE
    var viewShowLoad: UIView?
    var objSpinKit: RTSpinKitView?
    var backgroundTask = UIBackgroundTaskInvalid
    var lastSelectedTab:Int = 0
    
    // GLOBAL
    let speaker = Speaker()
   // let screenRecorder = ScreenRecording()
    
    private var reachability:Reachability!

    // QUE
    let serialQueue1 = DispatchGroup()

    // SET WINDOW
    var window: UIWindow?
    
    // COMMAN VARIABLE
    var videoRecorderdFileUrl:URL?
    
    
    var recorder:ASScreenRecorder?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
//        UserDefaults.standard.set(true, forKey: PRO_FEATURES)
//        UserDefaults.standard.synchronize()
        
//        let vidFile = "1546413088.mp4"
//        let path = FileManager.documentsDir().appendingFormat("1546413085.m4a")
//        let filePath = URL(fileURLWithPath: path)
//
//
//        let vPath = "\(FileManager.documentsDir())/Replays/\(vidFile)"
//        let vfilePath = URL(fileURLWithPath: vPath)

//        let aAudioAsset = AVURLAsset(url:filePath , options: nil)
//        aAudioAsset.loadValuesAsynchronously(forKeys: ["playable", "tracks"], completionHandler: {
//            print(" total tracks \(aAudioAsset.tracks)")
//        })
//        self.mergeVideoAndAudio(videoUrl: vfilePath, audioUrl: filePath) { (error, url) in
//            print(error ?? "")
//            print(url?.absoluteString ?? "")
//        }
        ICloudUserIDProvider.getUserID { (response) in
            print(response)
        }
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldShowToolbarPlaceholder = false
        
        // SET STATUS BAR COLOR TO WHITE
//        UIApplication.shared.isStatusBarHidden = false
//        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent

        FirebaseOptions.defaultOptions()?.deepLinkURLScheme = Bundle.main.bundleIdentifier
        FirebaseApp.configure()
        let user_Id:String = UserDefaults.standard.value(forKey: UserInfo.USER_ID.rawValue) as? String ?? ""
        if(user_Id.isEmpty){
                Auth.auth().signInAnonymously() { (authResult, error) in
                let user = authResult?.user
                let uid = user?.uid
                UserDefaults.standard.set(uid, forKey: UserInfo.USER_ID.rawValue)
                UserDefaults.standard.synchronize()
            }
        }
     
        // CAMERA ACCESS PERMISSION
        if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) ==  AVAuthorizationStatus.authorized {
        } else {
            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted: Bool) -> Void in
            })
        }
        // PHOTO PERMISSIO
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos != .authorized {
            PHPhotoLibrary.requestAuthorization({status in
            })
        }
        // AUDIP PERMISION
        if #available(iOS 10.0, *) {
            if SFSpeechRecognizer.authorizationStatus() != .authorized {
                SFSpeechRecognizer.requestAuthorization { (sta) in
                }
            }
        } else {
            // Fallback on earlier versions
        }
       
        // INAPP
        let iap = InAppPurchase.default
        iap.addTransactionObserver { (result) in
            print(result)
        }
//        let FIR_ref: DatabaseReference! = Database.database().reference().child(TB_Question)
//
//        FIR_ref.child("1540871255").observeSingleEvent(of: .value, with: { (snapshot) in
//            print(snapshot.children)
//        }) { (error) in
//           // print(error)
//        }
        
      
        

//        ref.child("groups").queryOrdered(byChild:"state").queryEqual(toValue:groupState).observe(enventType: .value, with: { snapshot in
//            // Returns all groups with state "open"
//            for group in snapshot.children {
//                print(group)
//            }
//        })
        return true
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
        // ADD NOTIFIER FOR INTERNET CONNECTIN
        NotificationCenter.default.addObserver(self, selector:#selector(checkForReachability(notification:)), name: NSNotification.Name.reachabilityChanged, object: nil)
        self.reachability = Reachability.forInternetConnection();
        self.reachability.startNotifier();
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        
        // CLOSE RECORDING
        appDelegate?.stopScreenRecording()
        
        // IN APP REMOVE OBSERVER
        let iap = InAppPurchase.default
        iap.removeTransactionObserver()

        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.reachabilityChanged, object: nil)
        self.doBackgroundTask()
        
    }
    func doBackgroundTask(){
        self.beginBackgroundTask()
        let queue = DispatchQueue.global(qos: .background)
        queue.async {
            sleep(2)
            self.endBackgroundTask()
        }
    }
    func beginBackgroundTask(){
        backgroundTask = UIApplication.shared.beginBackgroundTask(withName: "background", expirationHandler: {
            self.endBackgroundTask()
        })
    }
    func endBackgroundTask(){
        UIApplication.shared.endBackgroundTask(backgroundTask)
        backgroundTask = UIBackgroundTaskInvalid
    }
    // FONT FOR ALL SCREEN
    func setTheFontSize(_ fontValue: UIFont?, valueFontSizeForX: CGFloat) -> UIFont? {
        var fontReturn: UIFont?
        if IS_IPHONE {
            if IS_IPHONE_5_OR_LESS {
                fontReturn = fontValue?.withSize(valueFontSizeForX - 2)
                return fontReturn
            } else if IS_IPHONE_Regular {
                fontReturn = fontValue?.withSize(valueFontSizeForX )
                return fontReturn
            }else if IS_IPHONE_Plus {
                fontReturn = fontValue?.withSize(valueFontSizeForX + 2 )
                return fontReturn
            }else if IS_IPHONE_X {
                fontReturn = fontValue?.withSize(valueFontSizeForX + 2)
                return fontReturn
            }else if IS_IPHONE_XS {
                fontReturn = fontValue?.withSize(valueFontSizeForX + 2)
                return fontReturn
            }else {
                fontReturn = fontValue?.withSize(valueFontSizeForX)
                return fontReturn
            }
        } else {
            fontReturn = fontValue?.withSize(valueFontSizeForX + 6)
            return fontReturn
            
        }
    }
    
    func setTheFontForWithScreen(_ strFontName: String?, valueFontSizeForX: CGFloat) -> UIFont? {
        var fontReturn: UIFont?
        if IS_IPHONE {
            if IS_IPHONE_5_OR_LESS {
                fontReturn = UIFont(name: strFontName ?? "", size: valueFontSizeForX - 2)
            } else if IS_IPHONE_Regular {
                fontReturn = UIFont(name: strFontName ?? "", size: valueFontSizeForX )
            } else if IS_IPHONE_Plus {
                fontReturn = UIFont(name: strFontName ?? "", size: valueFontSizeForX + 2)
            } else if IS_IPHONE_X {
                fontReturn = UIFont(name: strFontName ?? "", size: valueFontSizeForX  + 2)
            }else if IS_IPHONE_XS {
                fontReturn = UIFont(name: strFontName ?? "", size: valueFontSizeForX + 2)
            }else {
                fontReturn = UIFont(name: strFontName ?? "", size: valueFontSizeForX )
            }
        } else if IS_IPOD {
            fontReturn = UIFont(name: strFontName ?? "", size: valueFontSizeForX - 1)
        } else {
            fontReturn = UIFont(name: strFontName ?? "", size: valueFontSizeForX + 6)
        }
        return fontReturn
    }
    
    
    
    func applicationWillTerminate(_ application: UIApplication) {
        
        self.saveContext()
    }
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        return self.application(application, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: "")
    }
    
    func application(_ application: UIApplication,
                     open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        if GIDSignIn.sharedInstance().handle(url, sourceApplication: sourceApplication, annotation: annotation) {
            return true
        }
        
        return Invites.handleUniversalLink(url) { invite, error in
            // ...
        }
        if DynamicLinks.dynamicLinks().dynamicLink(fromCustomSchemeURL: url) != nil {
            return true
        }
    }
    func application(_ application: UIApplication, continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        let handled = DynamicLinks.dynamicLinks().handleUniversalLink(userActivity.webpageURL!) { (dynamiclink, error) in
            // ...
        }
        
        return handled
    }
   
    
 
    
    //MARK: -CUSTOM LOADING METHODS
    
    func startLoadingview() {

        DispatchQueue.main.async {
            if self.objSpinKit?.isAnimating() == true {
                return
            }
            /*
             DISPLAY CUSTOM LOADING SCREEN WHEN THIS METHOD CALLS.
             */
            // CREATE CUSTOM VIEW
            self.viewShowLoad = UIView()
            let rect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.viewShowLoad!.frame = rect
            self.viewShowLoad!.backgroundColor = UIColor.clear
            // SET THE VIEW INSIDE MAIN VIEW
            let viewUp: UIView = UIView(frame: self.viewShowLoad!.frame)
            viewUp.backgroundColor = UIColor.black
            viewUp.alpha = 0.5
            self.viewShowLoad!.addSubview(viewUp)
            // CUSTOM ACTIVITY INDICATOR
            self.objSpinKit = RTSpinKitView(style: RTSpinKitViewStyle(rawValue: 1)!, color: UIColor.white)
            //[self colorFromRGB:99 :174 :13]];
            
            self.objSpinKit!.center = CGPoint(x:self.viewShowLoad!.frame.midX, y:self.viewShowLoad!.frame.midY)
            self.objSpinKit!.startAnimating()
            self.viewShowLoad!.addSubview(self.objSpinKit!)
            self.window!.addSubview(self.viewShowLoad!)
        }
        
    }
    
    func stopLoadingView() {
        /*
         REMOVE THE LOADING SCREEN WHEN THIS METHOD CALLS.
         */
        
        DispatchQueue.main.async {
            guard self.objSpinKit != nil else{return}
            self.objSpinKit!.stopAnimating()
            self.viewShowLoad!.removeFromSuperview()
        }
    }
    // MARK:- CUSTOM METHISD
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        let aCString = cString.cString(using: String.Encoding.utf8)
        let length = strlen(aCString)// returns a UInt
        if (length != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    func toggleFlash() {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        guard device.hasTorch else { return }
        
        do {
            try device.lockForConfiguration()
            
            if (device.torchMode == AVCaptureDevice.TorchMode.on) {
                device.torchMode = AVCaptureDevice.TorchMode.off
            } else {
                do {
                    try device.setTorchModeOn(level: 1.0)
                } catch {
                    print(error)
                }
            }
            
            device.unlockForConfiguration()
        } catch {
            print(error)
        }
    }
    //MARK:- CHECK INTERNET
    @objc func checkForReachability(notification:NSNotification)    {
        let networkReachability = notification.object as! Reachability;
        let remoteHostStatus = networkReachability.currentReachabilityStatus()
        if (remoteHostStatus == NotReachable){
            print("Not Reachable")
        }else if (remoteHostStatus == ReachableViaWiFi){
            print("Reachable via Wifi")
        }else{
            print("Reachable")
        }
        NotificationCenter.default.post(name: NSNotification.Name.init(NOTI_INTERNET_CHNAGED), object: nil)
    }
    // MARK: - Core Data stack
    lazy var applicationDocumentsDirectory: URL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named in the application's documents Application Support directory.
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count-1]
    }()
    
    // MARK: - Core Data stack
    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = Bundle.main.url(forResource: "Rapid_Fire", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject?
            dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject?
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        //var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }


    func mergeVideoAndAudio(videoUrl: URL,
                            audioUrl: URL,
                            shouldFlipHorizontally: Bool = false,
                            completion: @escaping (_ error: Error?, _ url: URL?) -> Void) {
        
        let mixComposition = AVMutableComposition()
        var mutableCompositionVideoTrack = [AVMutableCompositionTrack]()
        var mutableCompositionAudioTrack = [AVMutableCompositionTrack]()
        var mutableCompositionAudioOfVideoTrack = [AVMutableCompositionTrack]()
        
        //start merge
        let aVideoAsset = AVAsset(url: videoUrl)
       // let aAudioAsset = AVAsset(url: audioUrl)

        let aAudioAsset = AVURLAsset(url: audioUrl, options: nil)
        aAudioAsset.loadValuesAsynchronously(forKeys: ["playable", "tracks"], completionHandler: {
                print(" total tracks \(aAudioAsset.tracks)")
        })


        let compositionAddVideo = mixComposition.addMutableTrack(withMediaType: AVMediaType.video,
                                                                 preferredTrackID: kCMPersistentTrackID_Invalid)
        let compositionAddAudio = mixComposition.addMutableTrack(withMediaType: AVMediaType.audio,
                                                                 preferredTrackID: kCMPersistentTrackID_Invalid)
        let compositionAddAudioOfVideo = mixComposition.addMutableTrack(withMediaType: AVMediaType.audio,
                                                                        preferredTrackID: kCMPersistentTrackID_Invalid)
        
        let aVideoAssetTrack: AVAssetTrack = aVideoAsset.tracks(withMediaType: AVMediaType.video)[0]
        let aAudioOfVideoAssetTrack: AVAssetTrack? = aVideoAsset.tracks(withMediaType: AVMediaType.audio).first
        let aAudioAssetTrack: AVAssetTrack = aAudioAsset.tracks(withMediaType: AVMediaType.audio)[0]
        
        // Default must have tranformation
        compositionAddVideo?.preferredTransform = aVideoAssetTrack.preferredTransform
        
        if shouldFlipHorizontally {
            // Flip video horizontally
            var frontalTransform: CGAffineTransform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            frontalTransform = frontalTransform.translatedBy(x: -aVideoAssetTrack.naturalSize.width, y: 0.0)
            frontalTransform = frontalTransform.translatedBy(x: 0.0, y: -aVideoAssetTrack.naturalSize.width)
            compositionAddVideo?.preferredTransform = frontalTransform
        }
        
        mutableCompositionVideoTrack.append(compositionAddVideo!)
        mutableCompositionAudioTrack.append(compositionAddAudio!)
        mutableCompositionAudioOfVideoTrack.append(compositionAddAudioOfVideo!)
        
        do {
            try mutableCompositionVideoTrack[0].insertTimeRange(CMTimeRangeMake(kCMTimeZero,
                                                                                aVideoAssetTrack.timeRange.duration),
                                                                of: aVideoAssetTrack,
                                                                at: kCMTimeZero)
            
            //In my case my audio file is longer then video file so i took videoAsset duration
            //instead of audioAsset duration
            try mutableCompositionAudioTrack[0].insertTimeRange(CMTimeRangeMake(kCMTimeZero,
                                                                                aVideoAssetTrack.timeRange.duration),
                                                                of: aAudioAssetTrack,
                                                                at: kCMTimeZero)
            
            // adding audio (of the video if exists) asset to the final composition
            if let aAudioOfVideoAssetTrack = aAudioOfVideoAssetTrack {
                try mutableCompositionAudioOfVideoTrack[0].insertTimeRange(CMTimeRangeMake(kCMTimeZero,
                                                                                           aVideoAssetTrack.timeRange.duration),
                                                                           of: aAudioOfVideoAssetTrack,
                                                                           at: kCMTimeZero)
            }
        } catch {
            print(error.localizedDescription)
        }
        
        // Exporting
        let savePathUrl: URL = URL(fileURLWithPath: NSHomeDirectory() + "/Documents/newVideo.mov")
        do { // delete old video
            try FileManager.default.removeItem(at: savePathUrl)
        } catch { print(error.localizedDescription) }
        
        let assetExport: AVAssetExportSession = AVAssetExportSession(asset: mixComposition, presetName: AVAssetExportPresetHighestQuality)!
        assetExport.outputFileType = AVFileType.mp4
        assetExport.outputURL = savePathUrl
        assetExport.shouldOptimizeForNetworkUse = true
        
        assetExport.exportAsynchronously { () -> Void in
            switch assetExport.status {
            case AVAssetExportSessionStatus.completed:
                print("success")
                completion(nil, savePathUrl)
            case AVAssetExportSessionStatus.failed:
                print("failed \(assetExport.error?.localizedDescription ?? "error nil")")
                completion(assetExport.error, nil)
            case AVAssetExportSessionStatus.cancelled:
                print("cancelled \(assetExport.error?.localizedDescription ?? "error nil")")
                completion(assetExport.error, nil)
            default:
                print("complete")
                completion(assetExport.error, nil)
            }
        }
        
    }
    
    ////MARK:- SCREEN RECORDING
    func startScreenRecording() {
        recorder = ASScreenRecorder.sharedInstance()
        recorder?.createDirectory("RapidFire")
        recorder?.videoURL = URL.init(fileURLWithPath:methodfilePath(getTimeStamp()))
        videoRecorderdFileUrl = recorder?.videoURL
        recorder?.startRecording()
    }
    func stopScreenRecording() {
        recorder?.stopRecording(completion: {
            print("FINISH RECORDING")
        })
    }
    func methodfilePath(_ fileName: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0] as String
        let filePath = "\(documentsDirectory)/RapidFire/\(fileName).mov"
        return filePath
    }
    func methodGetDocumentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0] as String
        return documentsDirectory
    }
    func methodGetDocumentsVideoDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        var documentsDirectory = paths[0] as String
        documentsDirectory = "\(documentsDirectory)/RapidFire/"
        return documentsDirectory
    }
}

