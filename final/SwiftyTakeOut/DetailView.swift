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

import SwiftUI

struct DetailView: View {
  @EnvironmentObject private var locationManager: LocationManager
  @State private var orderPlaced = false
  let menuItem: MenuItem
  var price: String {
    return "$" + String(format: "%.2f", menuItem.price)
  }

  var body: some View {
    VStack {
      Image(menuItem.imageName)
        .resizable()
        .frame(maxWidth: 300, maxHeight: 600)
        .aspectRatio(contentMode: .fit)
      Text(menuItem.name)
        .font(.headline)
      Divider()
      Text("Price: \(price)")
        .font(.subheadline)
        .padding(15)
      Button(action: placeOrder) {
        Text("Place Order: \(price)")
          .foregroundColor(.white)
          .frame(minWidth: 100, maxWidth: .infinity)
          .frame(height: 45)
      }
      .background(Color("rw-green"))
      .cornerRadius(3.0)
    }
    .alert(isPresented: $orderPlaced) {
      Alert(
        title: Text("Food Ordered"),
        message:
          Text("""
            Your food has been ordered.
            Would you like to be notified on arrival?
            """),
        primaryButton: .default(Text("Yes")) {
          requestNotification()
        },
        secondaryButton: .default(Text("No"))
      )
    }
    .padding()
    .navigationBarTitle(Text(menuItem.name), displayMode: .inline)
  }

  func placeOrder() {
    orderPlaced = true
  }

  func requestNotification() {
    locationManager.validateLocationAuthorizationStatus()
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(menuItem: menuItems[0])
  }
}
