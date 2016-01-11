import UIKit
import MapKit
import CoreLocation
import AudioToolbox


class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    var gotGeoCache = false
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        
        let myLocation = CLLocationCoordinate2D(latitude: 50.716098, longitude: -1.875780)
        let myRegion = CLCircularRegion(center: myLocation, radius: 100, identifier: "Trigger Download")

        locationManager.startMonitoringForRegion(myRegion)
        
        mapView.setUserTrackingMode(.Follow, animated: true)
        mapView.mapType = MKMapType.Satellite
        
        let gardensLocation = CLLocationCoordinate2DMake(50.716098, -1.875780)
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = gardensLocation
        dropPin.title = "Geocache"
        mapView.addAnnotation(dropPin)
        
        self.mapView.delegate = self

    }
    
    @IBAction func trackUser(sender: AnyObject) {
        mapView.setUserTrackingMode(.Follow, animated: true)
    }
    
}

extension ViewController: MKMapViewDelegate {
    
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        if gotGeoCache == false {
            gotGeoCache = true
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            performSegueWithIdentifier("ViewGeocache", sender: self)
        }
        
    }

}