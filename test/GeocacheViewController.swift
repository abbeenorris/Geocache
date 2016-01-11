import UIKit
import Alamofire
import SwiftyJSON

class GeocacheViewController: UIViewController {
    
    var json: JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadGeocache()
        
    }
    
    func downloadGeocache() {
        Alamofire.request(.GET, "http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=2de143494c0b295cca9337e1e96b00e0")
            .response { request, response, data, error in
                
                if let data = data {
                    self.json = JSON(data: data)
                    self.doSomething()
                }
                
        }
    }
    
    func doSomething() {
        print(json!)
        //prints all the data from site
        print(json!["weather"][0]["description"].stringValue)
        //Zero is inserted when the data is inside an array, eg - weather - array - id, main, icon, description
        print(json!["name"].stringValue)
        print(json!["wind"]["speed"].doubleValue)
    }
}
