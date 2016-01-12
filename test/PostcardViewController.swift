import UIKit

class PostcardViewController: UIViewController {
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var playRoundButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.playRoundButton.setTitle("Next", forState: UIControlState.Normal)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func playRoundTapped(sender: UIButton) {
        
        let firstRandomNumber = arc4random_uniform(6) + 1
        let firstCardString:String = String(format: "Geo%i", firstRandomNumber)
    
        self.firstImageView.image = UIImage(named: firstCardString)

    }
    
    
}



