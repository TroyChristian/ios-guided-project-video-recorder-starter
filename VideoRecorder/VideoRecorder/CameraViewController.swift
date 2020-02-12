//
//  CameraViewController.swift
//  VideoRecorder
//
//  Created by Paul Solt on 10/2/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    lazy private var captureSession = AVCaptureSession()
    @IBOutlet var recordButton: UIButton!
    @IBOutlet var cameraView: CameraPreviewView!


	override func viewDidLoad() {
		super.viewDidLoad()

		// Resize camera preview to fill the entire screen
		cameraView.videoPlayerView.videoGravity = .resizeAspectFill
        setUpCamera()
	}
    
   
        
        
        
    
    
    private func setUpCamera() {
        let camera = bestCamera()
        
        // configuration
        
        
        // commit configuration
    }
    private func bestCamera() -> AVCaptureDevice {
        // front / back
        // wide angle, ultra wide angle, depth, zoom lens
        // try ultra wide lens
        if let device = AVCaptureDevice.default(.builtInUltraWideCamera, for: .video, position: .back) {
            return device
        }
        // try wide angle lens
        if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) {
            return device
        }
        fatalError("No cameras available on the device (or you're using a simulator)")
    }


    @IBAction func recordButtonPressed(_ sender: Any) {

	}
	
	/// Creates a new file URL in the documents directory
	private func newRecordingURL() -> URL {
		let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

		let formatter = ISO8601DateFormatter()
		formatter.formatOptions = [.withInternetDateTime]

		let name = formatter.string(from: Date())
		let fileURL = documentsDirectory.appendingPathComponent(name).appendingPathExtension("mov")
		return fileURL
	}

}
