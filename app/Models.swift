import Foundation
import Combine

struct Nutrition: Codable {
    let calories: Int
    let protein: Int
    let carbs: Int
    let fat: Int
    let sugar: Int
    let fiber: Int
}

struct Burger: Identifiable, Codable {
    let id = UUID()
    let name: String
    let description: String
    let price: Double
    let image: String
    let category: String
    let nutrition: Nutrition
    
    enum CodingKeys: String, CodingKey {
        case name, description, price, image, category, nutrition
    }
}

struct CartItem: Identifiable {
    let id = UUID()
    let burger: Burger
    var quantity: Int
    
    var subtotal: Double {
        burger.price * Double(quantity)
    }
}

struct Order: Identifiable, Codable {
    let id = UUID()
    let items: [OrderItem]
    let total: Double
    let timestamp: Date
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case items, total, timestamp, status
    }
}

struct OrderItem: Codable {
    let burgerName: String
    let quantity: Int
    let price: Double
}

class ShoppingCart: ObservableObject {
    @Published var items: [CartItem] = []
    @Published var orders: [Order] = []
    
    var total: Double {
        items.reduce(0) { $0 + $1.subtotal }
    }
    
    func addBurger(_ burger: Burger) {
        if let index = items.firstIndex(where: { $0.burger.id == burger.id }) {
            items[index].quantity += 1
        } else {
            items.append(CartItem(burger: burger, quantity: 1))
        }
    }
    
    func removeBurger(at index: Int) {
        items.remove(at: index)
    }
    
    func updateQuantity(_ quantity: Int, at index: Int) {
        if quantity <= 0 {
            items.remove(at: index)
        } else {
            items[index].quantity = quantity
        }
    }
    
    func clearCart() {
        items.removeAll()
    }
    
    func createOrder() -> Order {
        let orderItems = items.map { OrderItem(burgerName: $0.burger.name, quantity: $0.quantity, price: $0.burger.price) }
        let order = Order(items: orderItems, total: total, timestamp: Date(), status: "Preparing")
        orders.append(order)
        clearCart()
        return order
    }
}
