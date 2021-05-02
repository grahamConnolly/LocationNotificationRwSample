/// Copyright (c) 2021 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import CoreLocation
import UserNotifications

class LocationManager: NSObject, ObservableObject {
  let location = CLLocationCoordinate2D(latitude: 37.33182, longitude: -122.03118)
  let notificationCenter = UNUserNotificationCenter.current()
  lazy var storeRegion = makeStoreRegion()
  @Published var didArriveAtTakeout = false
  // 1
  lazy var locationManager = makeLocationManager()
  // 2
  private func makeLocationManager() -> CLLocationManager {
    // 3
    let manager = CLLocationManager()
    manager.allowsBackgroundLocationUpdates = true
    // 4
    return manager
  }

  // 1
  private func makeStoreRegion() -> CLCircularRegion {
    // 2
    let region = CLCircularRegion(
      center: location,
      radius: 2,
      identifier: UUID().uuidString)
    // 3
    region.notifyOnEntry = true
    // 4
    return region
  }

  // 1
  func validateLocationAuthorizationStatus() {
    // 2
    switch locationManager.authorizationStatus {
    // 3
    case .notDetermined, .denied, .restricted:
      // 4
      print("Location Services Not Authorized")
      locationManager.requestWhenInUseAuthorization()
      requestNotificationAuthorization()

    // 5
    case .authorizedWhenInUse, .authorizedAlways:
      // 6
      print("Location Services Authorized")
      requestNotificationAuthorization()

    default:
      break
    }
  }

  // 1
  private func requestNotificationAuthorization() {
    // 2
    let options: UNAuthorizationOptions = [.sound, .alert]
    // 3
    notificationCenter
      .requestAuthorization(options: options) { [weak self] result, _ in
        // 4
        print("Auth Request result: \(result)")
        if result {
          self?.registerNotification()
        }
      }
  }

  // 1
  private func registerNotification() {
    // 2
    let notificationContent = UNMutableNotificationContent()
    notificationContent.title = "Welcome to Swifty TakeOut"
    notificationContent.body = "Your order will be ready shortly."
    notificationContent.sound = .default

    // 3
    let trigger = UNLocationNotificationTrigger(region: storeRegion, repeats: false)

    // 4
    let request = UNNotificationRequest(
      identifier: UUID().uuidString,
      content: notificationContent,
      trigger: trigger)

    // 5
    notificationCenter
      .add(request) { error in
        if error != nil {
          print("Error: \(String(describing: error))")
        }
      }
  }

  // 1
  override init() {
    super.init()
    // 2
    notificationCenter.delegate = self
  }
}
extension LocationManager: UNUserNotificationCenterDelegate {
  // 1
  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    didReceive response: UNNotificationResponse,
    withCompletionHandler completionHandler: @escaping () -> Void
  ) {
    // 2
    print("Received Notification")
    didArriveAtTakeout = true
    // 3
    completionHandler()
  }

  // 4
  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler:
      @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    // 5
    print("Received Notification in Foreground")
    didArriveAtTakeout = true
    // 6
    completionHandler(.sound)
  }
}
