//
//  UpView.swift
//
//  Code generated using QuartzCode on 2014-11-12.
//  www.quartzcodeapp.com
//

import UIKit

class UpView: UIView {
	
	var layerWithAnims : [CALayer]!
	var animationAdded : Bool = false
	var replicator : CAReplicatorLayer!
	var up : CAShapeLayer!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupLayers()
	}
	
	required init(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)
		setupLayers()
	}
	
	func setupLayers(){
		replicator = CAReplicatorLayer()
		replicator.frame               = CGRectMake(47, 155, 471, 333)
		replicator.instanceCount       = 2
		replicator.instanceColor       = UIColor(red:1, green: 1, blue:1, alpha:1).CGColor
		replicator.instanceGreenOffset = 0.1
		replicator.instanceAlphaOffset = -0.8
		replicator.instanceTransform   = CATransform3DConcat(CATransform3DMakeTranslation(0, -1100, 0), CATransform3DMakeRotation(100 * CGFloat(M_PI/180), -1, -0, -0))
		self.layer.addSublayer(replicator)
		
		up = CAShapeLayer()
		up.frame       = CGRectMake(10, 12, 447, 311)
		up.lineCap     = kCALineCapRound
		up.fillColor   = nil
		up.strokeColor = UIColor(red:0.111, green: 0.954, blue:0.0158, alpha:1).CGColor
		up.lineWidth   = 14
		up.path        = upPath().CGPath;
		replicator.addSublayer(up)
		
		self.layerWithAnims = [replicator, up]
	}
	
	
	@IBAction func startAllAnimations(sender: AnyObject!){
		self.animationAdded = false
		for layer in self.layerWithAnims{
			layer.speed = 1
		}
		
		up.addAnimation(upAnimation(), forKey:"upAnimation")
	}
	
	var progress: CGFloat = 0 {
		didSet{
			if(!self.animationAdded){
				startAllAnimations(nil)
				self.animationAdded = true
				for layer in self.layerWithAnims{
					layer.speed = 0
					layer.timeOffset = 0
				}
			}
			else{
				var totalDuration : CGFloat = 2
				var offset = progress * totalDuration
				for layer in self.layerWithAnims{
					layer.timeOffset = CFTimeInterval(offset)
				}
			}
		}
	}
	
	func upAnimation() -> CABasicAnimation{
		var strokeEndAnim            = CABasicAnimation(keyPath:"strokeEnd")
		strokeEndAnim.fromValue      = 0;
		strokeEndAnim.toValue        = 1;
		strokeEndAnim.duration       = 2
		strokeEndAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0, 0, 0.901, -0.0257)
		strokeEndAnim.repeatCount    = Float.infinity
		strokeEndAnim.fillMode = kCAFillModeForwards
		strokeEndAnim.removedOnCompletion = false
		
		return strokeEndAnim;
	}
	
	//MARK: - Bezier Path
	
	func upPath() -> UIBezierPath{
		var upPath = UIBezierPath()
		upPath.moveToPoint(CGPointMake(0, 311))
		upPath.addCurveToPoint(CGPointMake(446.902, 0.338), controlPoint1:CGPointMake(446.902, 311), controlPoint2:CGPointMake(446.902, 0.338))
		
		return upPath;
	}

}