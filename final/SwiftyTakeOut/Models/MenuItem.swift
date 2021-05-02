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

import Foundation

struct MenuItem {
  let id = UUID()
  var name: String
  var imageName: String
  var price: Double
}

// MARK: - Menu Items
let menuItems: [MenuItem] = [
  MenuItem(name: "Margherita Pizza SE", imageName: "cheese-pizza-small", price: 7.00),
  MenuItem(name: "Margherita Pizza Max", imageName: "cheese-pizza", price: 10.00),
  MenuItem(name: "Margherita Pizza Max Pro", imageName: "cheese-pizza", price: 12.00),
  MenuItem(name: "Chicken Pizza SE", imageName: "chicken-pizza-small", price: 8.00),
  MenuItem(name: "Chicken Pizza Max", imageName: "chicken-pizza", price: 11.00),
  MenuItem(name: "Chicken Pizza Max Pro", imageName: "chicken-pizza", price: 14.00),
  MenuItem(name: "Pepperoni Pizza SE", imageName: "pep-pizza-small", price: 7.00),
  MenuItem(name: "Pepperoni Pizza Max", imageName: "pep-pizza", price: 11.00),
  MenuItem(name: "Pepperoni Pizza Max Pro", imageName: "pep-pizza", price: 14.00),
  MenuItem(name: "Swifty Shake Series 6", imageName: "shake", price: 3.50),
  MenuItem(name: "Swifty Shake SE", imageName: "shake", price: 2.00),
  MenuItem(name: "Swifty Shake Series 3", imageName: "shake", price: 2.75)
]
