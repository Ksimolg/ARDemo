//
//  ViewController.swift
//  ARDemo
//
//  Created by _ on 20.01.2021.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        // ось x y z , и поинты
        
        let scene = SCNScene()
        createBox(in: scene)
        
        
        
        sceneView.scene = scene
    }
    

    
    private func createBox(in scene: SCNScene) {
        let box = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        let boxMaterial = SCNMaterial()
        
        boxMaterial.diffuse.contents = UIColor.red
        boxMaterial.specular.contents = UIColor.yellow
        
        let boxNode = SCNNode(geometry: box)
        boxNode.geometry?.materials = [boxMaterial]
        boxNode.position = SCNVector3(0.0, 0.0, -0.5)
        scene.rootNode.addChildNode(boxNode)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }



}
