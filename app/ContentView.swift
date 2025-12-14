//
//  ContentView.swift
//  app
//
//  Created by Macbook_PRO on 2025/12/12.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var cart = ShoppingCart()
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack {
            Color(red: 0.11, green: 0.11, blue: 0.12)
                .ignoresSafeArea()
            
            TabView(selection: $selectedTab) {
                MenuView(cart: cart)
                    .tabItem {
                        Label("Menu", systemImage: "list.bullet")
                    }
                    .tag(0)
                
                CartView(cart: cart)
                    .tabItem {
                        Label("Cart", systemImage: "cart.fill")
                    }
                    .tag(1)
                
                OrderHistoryView(cart: cart)
                    .tabItem {
                        Label("Orders", systemImage: "clock.fill")
                    }
                    .tag(2)
            }
            .tint(.red)
        }
        .navigationTitle("🍔 Burger Shop")
    }
}

struct MenuView: View {
    @ObservedObject var cart: ShoppingCart
    @State private var searchText = ""
    @State private var selectedCategory = "All"
    
    let categories = ["All", "Classic", "Premium", "Specialty", "Vegan", "Healthy"]
    
    var filteredBurgers: [Burger] {
        burgerMenuData.filter { burger in
            (selectedCategory == "All" || burger.category == selectedCategory) &&
            (searchText.isEmpty || burger.name.localizedCaseInsensitiveContains(searchText))
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                SearchBar(text: $searchText)
                    .padding(.bottom, 12)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(categories, id: \.self) { category in
                            Button(action: { selectedCategory = category }) {
                                Text(category)
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 8)
                                    .background(selectedCategory == category ? Color.red : Color(red: 0.2, green: 0.2, blue: 0.21))
                                    .foregroundColor(selectedCategory == category ? .white : .gray)
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 12)
                
                ScrollView {
                    VStack(spacing: 14) {
                        ForEach(filteredBurgers) { burger in
                            BurgerCard(burger: burger, cart: cart)
                        }
                    }
                    .padding()
                }
            }
            .background(Color(red: 0.11, green: 0.11, blue: 0.12))
            .navigationTitle("🍔 Menu")
        }
    }
}

struct BurgerCard: View {
    let burger: Burger
    @ObservedObject var cart: ShoppingCart
    @State private var showDetailView = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(action: { showDetailView = true }) {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 14) {
                        Text(burger.image)
                            .font(.system(size: 48))
                            .frame(width: 60, height: 60)
                            .background(Color(red: 0.2, green: 0.2, blue: 0.21))
                            .cornerRadius(12)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text(burger.name)
                                .font(.system(.headline, design: .default))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text(burger.description)
                                .font(.caption)
                                .foregroundColor(.gray)
                                .lineLimit(2)
                            
                            HStack(spacing: 8) {
                                Text("$\(String(format: "%.2f", burger.price))")
                                    .font(.system(.body, design: .default))
                                    .fontWeight(.bold)
                                    .foregroundColor(.red)
                                
                                Spacer()
                            }
                        }
                        
                        Spacer()
                    }
                }
                .padding(14)
                .background(Color(red: 0.17, green: 0.17, blue: 0.18))
                .cornerRadius(14)
            }
            
            Button(action: { cart.addBurger(burger) }) {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 24))
                    .foregroundColor(.red)
            }
            .padding(14)
            
            if showDetailView {
                BurgerDetailView(burger: burger, cart: cart, isPresented: $showDetailView)
                    .transition(.move(edge: .trailing))
            }
        }
    }
}

struct BurgerDetailView: View {
    let burger: Burger
    @ObservedObject var cart: ShoppingCart
    @Binding var isPresented: Bool
    @State private var quantity = 1
    
    var body: some View {
        ZStack {
            Color(red: 0.11, green: 0.11, blue: 0.12)
                .ignoresSafeArea()
            
            VStack {
                // Close Button
                HStack {
                    Button(action: { isPresented = false }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(.red)
                    }
                    Spacer()
                }
                .padding()
                
                ScrollView {
                    VStack(spacing: 20) {
                        // Header with burger image
                        VStack {
                            Text(burger.image)
                                .font(.system(size: 120))
                                .frame(height: 150)
                                .background(Color(red: 0.2, green: 0.2, blue: 0.21))
                                .cornerRadius(16)
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            // Title and Category
                            VStack(alignment: .leading, spacing: 8) {
                                Text(burger.name)
                                    .font(.system(.title, design: .default))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                HStack(spacing: 8) {
                                    Text(burger.category)
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(Color.red)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                    
                                    Spacer()
                                    
                                    Text("$\(String(format: "%.2f", burger.price))")
                                        .font(.system(.title2, design: .default))
                                        .fontWeight(.bold)
                                        .foregroundColor(.red)
                                }
                            }
                            
                            Divider()
                                .background(Color(red: 0.2, green: 0.2, blue: 0.21))
                            
                            // Description
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Description")
                                    .font(.system(.headline, design: .default))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text(burger.description)
                                    .font(.body)
                                    .foregroundColor(.gray)
                                    .lineLimit(nil)
                            }
                            
                            Divider()
                                .background(Color(red: 0.2, green: 0.2, blue: 0.21))
                            
                            // Quantity Selector
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Quantity")
                                    .font(.system(.headline, design: .default))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                HStack(spacing: 16) {
                                    Button(action: { if quantity > 1 { quantity -= 1 } }) {
                                        Image(systemName: "minus.circle.fill")
                                            .font(.system(size: 32))
                                            .foregroundColor(.red)
                                    }
                                    
                                    Text("\(quantity)")
                                        .font(.system(.title2, design: .default))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(minWidth: 50)
                                    
                                    Button(action: { quantity += 1 }) {
                                        Image(systemName: "plus.circle.fill")
                                            .font(.system(size: 32))
                                            .foregroundColor(.red)
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Divider()
                                .background(Color(red: 0.2, green: 0.2, blue: 0.21))
                            
                            // Nutritional Information
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Nutritional Information")
                                    .font(.system(.headline, design: .default))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                VStack(spacing: 10) {
                                    HStack(spacing: 0) {
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Calories")
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                            Text("\(burger.nutrition.calories)")
                                                .font(.system(.body, design: .default))
                                                .fontWeight(.bold)
                                                .foregroundColor(.red)
                                        }
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Protein")
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                            Text("\(burger.nutrition.protein)g")
                                                .font(.system(.body, design: .default))
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Carbs")
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                            Text("\(burger.nutrition.carbs)g")
                                                .font(.system(.body, design: .default))
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Fat")
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                            Text("\(burger.nutrition.fat)g")
                                                .font(.system(.body, design: .default))
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    
                                    Divider()
                                        .background(Color(red: 0.25, green: 0.25, blue: 0.27))
                                    
                                    HStack(spacing: 0) {
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Sugar")
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                            Text("\(burger.nutrition.sugar)g")
                                                .font(.system(.body, design: .default))
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Fiber")
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                            Text("\(burger.nutrition.fiber)g")
                                                .font(.system(.body, design: .default))
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }
                                        
                                        Spacer()
                                    }
                                }
                                .padding(12)
                                .background(Color(red: 0.15, green: 0.15, blue: 0.16))
                                .cornerRadius(10)
                            }
                            
                            Divider()
                                .background(Color(red: 0.2, green: 0.2, blue: 0.21))
                            
                            // Why You'll Love It section
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Why You'll Love It")
                                    .font(.system(.headline, design: .default))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack(spacing: 12) {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.red)
                                            .frame(width: 20)
                                        Text("Premium quality ingredients")
                                            .foregroundColor(.gray)
                                    }
                                    
                                    HStack(spacing: 12) {
                                        Image(systemName: "flame.fill")
                                            .foregroundColor(.red)
                                            .frame(width: 20)
                                        Text("Fresh and delicious")
                                            .foregroundColor(.gray)
                                    }
                                    
                                    HStack(spacing: 12) {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.red)
                                            .frame(width: 20)
                                        Text("Made to order")
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                }
                
                // Add to Cart Button
                Button(action: {
                    for _ in 0..<quantity {
                        cart.addBurger(burger)
                    }
                    isPresented = false
                }) {
                    HStack {
                        Image(systemName: "cart.fill")
                        Text("Add to Cart")
                        Spacer()
                        Text("$\(String(format: "%.2f", burger.price * Double(quantity)))")
                    }
                    .font(.system(.headline, design: .default))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(12)
                    .padding()
                }
            }
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search burgers...", text: $text)
                .textFieldStyle(.plain)
                .foregroundColor(.white)
            
            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(12)
        .background(Color(red: 0.17, green: 0.17, blue: 0.18))
        .cornerRadius(12)
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

struct CartView: View {
    @ObservedObject var cart: ShoppingCart
    @State private var showOrderPlaced = false
    
    var body: some View {
        NavigationView {
            VStack {
                if cart.items.isEmpty {
                    VStack(spacing: 16) {
                        Text("🛒")
                            .font(.system(size: 64))
                        Text("Your cart is empty")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("Add some delicious burgers!")
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                } else {
                    List {
                        ForEach(Array(cart.items.enumerated()), id: \.element.id) { index, item in
                            CartItemRow(item: item, onQuantityChange: { quantity in
                                cart.updateQuantity(quantity, at: index)
                            }, onDelete: {
                                cart.removeBurger(at: index)
                            })
                        }
                        .listRowBackground(Color(red: 0.17, green: 0.17, blue: 0.18))
                        .listRowSeparatorTint(.gray)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    
                    VStack(spacing: 14) {
                        Divider()
                            .background(.gray)
                        
                        HStack {
                            Text("Subtotal")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("$\(String(format: "%.2f", cart.total))")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }
                        
                        HStack {
                            Text("Tax (10%)")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("$\(String(format: "%.2f", cart.total * 0.1))")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }
                        
                        Divider()
                            .background(.gray)
                        
                        HStack {
                            Text("Total")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                            Text("$\(String(format: "%.2f", cart.total * 1.1))")
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                                .font(.title3)
                        }
                        
                        Button(action: {
                            _ = cart.createOrder()
                            showOrderPlaced = true
                        }) {
                            Text("Place Order")
                                .frame(maxWidth: .infinity)
                                .padding(14)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .cornerRadius(12)
                        }
                        
                        Button(action: { cart.clearCart() }) {
                            Text("Clear Cart")
                                .frame(maxWidth: .infinity)
                                .padding(14)
                                .background(Color(red: 0.2, green: 0.2, blue: 0.21))
                                .foregroundColor(.red)
                                .fontWeight(.semibold)
                                .cornerRadius(12)
                        }
                    }
                    .padding()
                }
            }
            .background(Color(red: 0.11, green: 0.11, blue: 0.12))
            .navigationTitle("🛒 Cart")
            .alert("Order Placed!", isPresented: $showOrderPlaced) {
                Button("OK") { }
            } message: {
                Text("Your order has been placed successfully and will be ready soon!")
            }
        }
    }
}

struct CartItemRow: View {
    let item: CartItem
    let onQuantityChange: (Int) -> Void
    let onDelete: () -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            Text(item.burger.image)
                .font(.system(size: 36))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.burger.name)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("$\(String(format: "%.2f", item.burger.price))")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
            
            Spacer()
            
            HStack(spacing: 8) {
                Button(action: { onQuantityChange(item.quantity - 1) }) {
                    Image(systemName: "minus.circle")
                        .foregroundColor(.red)
                }
                
                Text("\(item.quantity)")
                    .frame(minWidth: 20)
                    .foregroundColor(.white)
                
                Button(action: { onQuantityChange(item.quantity + 1) }) {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.red)
                }
            }
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("$\(String(format: "%.2f", item.subtotal))")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Button(action: onDelete) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                        .font(.caption)
                }
            }
        }
        .padding(.vertical, 8)
    }
}

struct OrderHistoryView: View {
    @ObservedObject var cart: ShoppingCart
    
    var body: some View {
        NavigationView {
            VStack {
                if cart.orders.isEmpty {
                    VStack(spacing: 16) {
                        Text("📋")
                            .font(.system(size: 64))
                        Text("No orders yet")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("Place an order to see it here!")
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                } else {
                    List(cart.orders) { order in
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Order #\(order.id.uuidString.prefix(8))")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Text(order.timestamp.formatted(date: .abbreviated, time: .shortened))
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                
                                Text(order.status)
                                    .font(.caption2)
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 6)
                                    .background(order.status == "Preparing" ? Color.orange.opacity(0.3) : Color.green.opacity(0.3))
                                    .foregroundColor(order.status == "Preparing" ? .orange : .green)
                                    .cornerRadius(6)
                            }
                            
                            Divider()
                                .background(.gray)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                ForEach(order.items, id: \.burgerName) { item in
                                    HStack {
                                        Text("\(item.quantity)x \(item.burgerName)")
                                            .font(.caption)
                                            .foregroundColor(.white)
                                        Spacer()
                                        Text("$\(String(format: "%.2f", item.price))")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            
                            Divider()
                                .background(.gray)
                            
                            HStack {
                                Text("Total")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Spacer()
                                Text("$\(String(format: "%.2f", order.total))")
                                    .fontWeight(.bold)
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(12)
                        .listRowBackground(Color(red: 0.17, green: 0.17, blue: 0.18))
                        .listRowSeparatorTint(.gray)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }
            }
            .background(Color(red: 0.11, green: 0.11, blue: 0.12))
            .navigationTitle("📋 Orders")
        }
    }
}

#Preview {
    ContentView()
}
