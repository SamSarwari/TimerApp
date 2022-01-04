
import UIKit

class ViewController: UIViewController
{
   
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var addSeconds: UIButton!
    @IBOutlet weak var minusSeconds: UIButton!
    
    var timer = Timer()
    var minutes = 60
    
    let shapeLayer = CAShapeLayer()
    let basicAnimation =  CABasicAnimation(keyPath: "strokeEnd")
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    @IBAction func startButton(_ sender: Any)
    {
        // Make sure there arent any other timers running
        timer.invalidate()
        // Create the timer
        timer = Timer.scheduledTimer(timeInterval: 60, target: self , selector: #selector(ViewController.timerClass), userInfo: nil, repeats: true)
        
        


    }
    @IBAction func pauseButton(_ sender: Any)
    {
        timer.invalidate()
    }
    
    @IBAction func resetButton(_ sender: Any)
    {
        timer.invalidate()
        minutes = 0
        timerLabel.text = String(minutes)
    }
    
    @IBAction func addSeconds(_ sender: Any)
    {
        minutes = 30
        timerLabel.text = String(minutes)
        
        let center = CGPoint(x: 195, y: 190)
        
        let basicAnimation =  CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2250
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        //shapeLayer.add(basicAnimation, forKey: "urSoBasic")
        
        // Innerer Rand
        let trackLayer = CAShapeLayer()
        let CICircularpath =  UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2 , endAngle: 2 * CGFloat.pi, clockwise: true )
        
        trackLayer.path = CICircularpath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(trackLayer)
        
        
        shapeLayer.path = CICircularpath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.green.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
    }
    
    @IBAction func minusSeconds(_ sender: Any)
    {
        minutes = 5
        timerLabel.text = String(minutes)
        
        let center = CGPoint(x: 195, y: 190)
        
        let basicAnimation =  CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 375
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        //shapeLayer.add(basicAnimation, forKey: "urSoBasic")
        
        // Innerer Rand
        let trackLayer = CAShapeLayer()
        let CICircularpath =  UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2 , endAngle: 2 * CGFloat.pi, clockwise: true )
        
        trackLayer.path = CICircularpath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(trackLayer)
        
        
        shapeLayer.path = CICircularpath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.green.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
        
    }
    @objc func timerClass()
    {
        minutes -= 1
        timerLabel.text = String(minutes)
        if(minutes == 0)
        {
            timer.invalidate()
        }
    }
    
}

