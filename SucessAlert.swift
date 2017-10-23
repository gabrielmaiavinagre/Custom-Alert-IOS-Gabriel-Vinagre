//
//  SucessAlert.swift
//
//  Code generated using QuartzCode 1.62.0 on 21/10/17.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class SucessAlert: UIView, CAAnimationDelegate {
	
	var updateLayerValueForCompletedAnimation : Bool = false
	var animationAdded : Bool = false
	var completionBlocks = [CAAnimation: (Bool) -> Void]()
	var layers = [String: CALayer]()
	
	
	
	//MARK: - Life Cycle
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupProperties()
		setupLayers()
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)
		setupProperties()
		setupLayers()
	}
	
	var successAnimProgress: CGFloat = 0{
		didSet{
			if(!self.animationAdded){
				removeAllAnimations()
				addSuccessAnimation()
				self.animationAdded = true
				layer.speed = 0
				layer.timeOffset = 0
			}
			else{
				let totalDuration : CGFloat =  1.2//1.45
				let offset = successAnimProgress * totalDuration
				layer.timeOffset = CFTimeInterval(offset)
			}
		}
	}
	
	override var frame: CGRect{
		didSet{
			setupLayerFrames()
		}
	}
	
	override var bounds: CGRect{
		didSet{
			setupLayerFrames()
		}
	}
	
	func setupProperties(){
		
	}
	
	func setupLayers(){
		self.backgroundColor = UIColor(red:1, green: 1, blue:1, alpha:1)
		
		let circle = CAShapeLayer()
		self.layer.addSublayer(circle)
		layers["circle"] = circle
		
		let tick = CAShapeLayer()
		self.layer.addSublayer(tick)
		layers["tick"] = tick
		
		resetLayerProperties(forLayerIdentifiers: nil)
		setupLayerFrames()
	}
	
	func resetLayerProperties(forLayerIdentifiers layerIds: [String]!){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if layerIds == nil || layerIds.contains("circle"){
			let circle = layers["circle"] as! CAShapeLayer
			circle.setValue(-139.13 * CGFloat.pi/180, forKeyPath:"transform.rotation")
			circle.lineCap     = kCALineCapRound
			circle.fillColor   = nil
			circle.strokeColor = UIColor(red:0, green: 0.917, blue:0.0941, alpha:1).cgColor
			circle.lineWidth   = 10
			circle.strokeEnd   = 0
		}
		if layerIds == nil || layerIds.contains("tick"){
			let tick = layers["tick"] as! CAShapeLayer
			tick.lineCap     = kCALineCapRound
			tick.fillColor   = nil
			tick.strokeColor = UIColor(red:0.0673, green: 0.918, blue:0.139, alpha:1).cgColor
			tick.lineWidth   = 10
		}
		
		CATransaction.commit()
	}
	
	func setupLayerFrames(){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if let circle = layers["circle"] as? CAShapeLayer{
			circle.transform = CATransform3DIdentity
			circle.frame     = CGRect(x: 0, y: 0, width: 1 * circle.superlayer!.bounds.width, height:  circle.superlayer!.bounds.height)
			circle.setValue(-139.13 * CGFloat.pi/180, forKeyPath:"transform.rotation")
			circle.path      = circlePath(bounds: layers["circle"]!.bounds).cgPath
		}
		
		if let tick = layers["tick"] as? CAShapeLayer{
			tick.frame = CGRect(x: 0.31438 * tick.superlayer!.bounds.width, y: 0.37096 * tick.superlayer!.bounds.height, width: 0.37124 * tick.superlayer!.bounds.width, height: 0.25807 * tick.superlayer!.bounds.height)
			tick.path  = tickPath(bounds: layers["tick"]!.bounds).cgPath
		}
		
		CATransaction.commit()
	}
	
	//MARK: - Animation Setup
	
	func addSuccessAnimation(completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = 1.449
			completionAnim.delegate = self
			completionAnim.setValue("Success", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"Success")
			if let anim = layer.animation(forKey: "Success"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		self.layer.speed = 1
		self.animationAdded = false
		
		let fillMode : String = kCAFillModeForwards
		
		////Circle animation
		let circleStrokeEndAnim            = CAKeyframeAnimation(keyPath:"strokeEnd")
		circleStrokeEndAnim.values         = [0, 1]
		circleStrokeEndAnim.keyTimes       = [0, 1]
		circleStrokeEndAnim.duration       = 1.2
		circleStrokeEndAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.664, -0.201, 0.438, 1.18)
		
		let circleOpacityAnim            = CAKeyframeAnimation(keyPath:"opacity")
		circleOpacityAnim.values         = [0, 5, 5]
		circleOpacityAnim.keyTimes       = [0, 0.83, 1]
		circleOpacityAnim.duration       = 1.45
		circleOpacityAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
		
		let circleSuccessAnim : CAAnimationGroup = QCMethod.group(animations: [circleStrokeEndAnim, circleOpacityAnim], fillMode:fillMode)
		layers["circle"]?.add(circleSuccessAnim, forKey:"circleSuccessAnim")
		
		////Tick animation
		let tickOpacityAnim            = CAKeyframeAnimation(keyPath:"opacity")
		tickOpacityAnim.values         = [0, 0, 5]
		tickOpacityAnim.keyTimes       = [0, 0.784, 1]
		tickOpacityAnim.duration       = 1.45
		tickOpacityAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
		
		let tickStrokeEndAnim            = CAKeyframeAnimation(keyPath:"strokeEnd")
		tickStrokeEndAnim.values         = [0, 1]
		tickStrokeEndAnim.keyTimes       = [0, 1]
		tickStrokeEndAnim.duration       = 0.467
		tickStrokeEndAnim.beginTime      = 0.978
		tickStrokeEndAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
		
		let tickSuccessAnim : CAAnimationGroup = QCMethod.group(animations: [tickOpacityAnim, tickStrokeEndAnim], fillMode:fillMode)
		layers["tick"]?.add(tickSuccessAnim, forKey:"tickSuccessAnim")
	}
	
	//MARK: - Animation Cleanup
	
	func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
		if let completionBlock = completionBlocks[anim]{
			completionBlocks.removeValue(forKey: anim)
			if (flag && updateLayerValueForCompletedAnimation) || anim.value(forKey: "needEndAnim") as! Bool{
				updateLayerValues(forAnimationId: anim.value(forKey: "animId") as! String)
				removeAnimations(forAnimationId: anim.value(forKey: "animId") as! String)
			}
			completionBlock(flag)
		}
	}
	
	func updateLayerValues(forAnimationId identifier: String){
		if identifier == "Success"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: layers["circle"]!.animation(forKey: "circleSuccessAnim"), theLayer:layers["circle"]!)
			QCMethod.updateValueFromPresentationLayer(forAnimation: layers["tick"]!.animation(forKey: "tickSuccessAnim"), theLayer:layers["tick"]!)
		}
	}
	
	func removeAnimations(forAnimationId identifier: String){
		if identifier == "Success"{
			layers["circle"]?.removeAnimation(forKey: "circleSuccessAnim")
			layers["tick"]?.removeAnimation(forKey: "tickSuccessAnim")
		}
		self.layer.speed = 1
	}
	
	func removeAllAnimations(){
		for layer in layers.values{
			layer.removeAllAnimations()
		}
		self.layer.speed = 1
	}
	
	//MARK: - Bezier Path
	
	func circlePath(bounds: CGRect) -> UIBezierPath{
		let circlePath = UIBezierPath()
		let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
		
		circlePath.move(to: CGPoint(x:minX + 0.85355 * w, y: minY + 0.85355 * h))
		circlePath.addCurve(to: CGPoint(x:minX + 0.85355 * w, y: minY + 0.14645 * h), controlPoint1:CGPoint(x:minX + 1.04882 * w, y: minY + 0.65829 * h), controlPoint2:CGPoint(x:minX + 1.04882 * w, y: minY + 0.34171 * h))
		circlePath.addCurve(to: CGPoint(x:minX + 0.14645 * w, y: minY + 0.14645 * h), controlPoint1:CGPoint(x:minX + 0.65829 * w, y: minY + -0.04882 * h), controlPoint2:CGPoint(x:minX + 0.34171 * w, y: minY + -0.04882 * h))
		circlePath.addCurve(to: CGPoint(x:minX + 0.14645 * w, y: minY + 0.85355 * h), controlPoint1:CGPoint(x:minX + -0.04882 * w, y: minY + 0.34171 * h), controlPoint2:CGPoint(x:minX + -0.04882 * w, y: minY + 0.65829 * h))
		circlePath.addCurve(to: CGPoint(x:minX + 0.85355 * w, y: minY + 0.85355 * h), controlPoint1:CGPoint(x:minX + 0.34171 * w, y: minY + 1.04882 * h), controlPoint2:CGPoint(x:minX + 0.65829 * w, y: minY + 1.04882 * h))
		
		return circlePath
	}
	
	func tickPath(bounds: CGRect) -> UIBezierPath{
		let tickPath = UIBezierPath()
		let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
		
		tickPath.move(to: CGPoint(x:minX, y: minY + 0.60222 * h))
		tickPath.addLine(to: CGPoint(x:minX + 0.3634 * w, y: minY + h))
		tickPath.addLine(to: CGPoint(x:minX + w, y: minY))
		
		return tickPath
	}
	
	
}
