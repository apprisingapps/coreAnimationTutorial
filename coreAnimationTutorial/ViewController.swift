import UIKit

class ViewController:  UIViewController
{
    override func viewDidLoad ()
    {
        super.viewDidLoad ()
        
        setup ()
    }
    
    func setup ()
    {
        let redLayer = CALayer ()
        
        redLayer.frame = CGRect (x: 50, y: 50, width: 50, height: 50)
        redLayer.backgroundColor = UIColor.red.cgColor
        redLayer.shadowColor = UIColor.black.cgColor
        redLayer.shadowOpacity = 0.8
        redLayer.shadowRadius = 3
        
        // Round corners
        redLayer.cornerRadius = 25
        
        // Set border
        redLayer.borderColor = UIColor.black.cgColor
        redLayer.borderWidth = 10
       
        let imageLayer = CALayer ()
        let image = UIImage (named:  "butterflysmall.jpg")!
        
        imageLayer.contents = image.cgImage
        imageLayer.frame = CGRect (x:  0, y:  100, width:  image.size.width, height:  image.size.height)
        imageLayer.contentsGravity = kCAGravityResizeAspect
        imageLayer.contentsScale = UIScreen.main.scale
 
        // Create a blank animation using the keyPath "cornerRadius", the property we want to animate
        let animation = CABasicAnimation (keyPath:  "cornerRadius")
        
        // Set the starting value
        animation.fromValue = redLayer.cornerRadius
        
        // Set the completion value
        animation.toValue = 0
        
        // How may times should the animation repeat?
        animation.repeatCount = 1000
        
        // Finally, add the animation to the layer
        redLayer.add (animation, forKey:  "cornerRadius")
        
        self.view.layer.addSublayer (imageLayer)
        self.view.layer.addSublayer (redLayer)
    }
}
