
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
    var seconds = 60
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func startButton(_ sender: Any)
    {
        // Make sure there arent any other timers running
        timer.invalidate()
        // Create the timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self , selector: #selector(ViewController.timerClass), userInfo: nil, repeats: true)
    }
    @IBAction func pauseButton(_ sender: Any)
    {
        timer.invalidate()
    }
    
    @IBAction func resetButton(_ sender: Any)
    {
        timer.invalidate()
        seconds = 60
        timerLabel.text = String(seconds)
    }
    
    @IBAction func addSeconds(_ sender: Any)
    {
        seconds = seconds + 5
        timerLabel.text = String(seconds)
    }
    
    @IBAction func minusSeconds(_ sender: Any)
    {
        seconds = seconds - 5
        timerLabel.text = String(seconds)
    }
    @objc func timerClass()
    {
        seconds -= 1
        timerLabel.text = String(seconds)
        if(seconds == 0)
        {
            timer.invalidate()
        }
    }
    
}

