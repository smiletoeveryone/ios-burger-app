import Foundation

let burgerMenuData: [Burger] = [
    Burger(
        name: "Classic Cheeseburger",
        description: "Juicy beef patty with melted cheddar cheese and fresh vegetables",
        price: 8.99,
        image: "🍔",
        category: "Classic",
        nutrition: Nutrition(calories: 540, protein: 32, carbs: 42, fat: 24, sugar: 8, fiber: 2)
    ),
    Burger(
        name: "Bacon Cheeseburger",
        description: "Crispy bacon, melted cheese, and flame-grilled beef patty",
        price: 10.99,
        image: "🥓",
        category: "Premium",
        nutrition: Nutrition(calories: 620, protein: 38, carbs: 44, fat: 32, sugar: 6, fiber: 2)
    ),
    Burger(
        name: "Double Deluxe",
        description: "Two beef patties with cheese, bacon, lettuce, and special sauce",
        price: 12.99,
        image: "🍔",
        category: "Premium",
        nutrition: Nutrition(calories: 780, protein: 48, carbs: 50, fat: 42, sugar: 10, fiber: 3)
    ),
    Burger(
        name: "Spicy Jalapeno Burger",
        description: "Beef patty with spicy jalapenos, pepper jack cheese, and chipotle mayo",
        price: 9.99,
        image: "🌶️",
        category: "Specialty",
        nutrition: Nutrition(calories: 560, protein: 34, carbs: 40, fat: 28, sugar: 7, fiber: 2)
    ),
    Burger(
        name: "Mushroom Swiss Burger",
        description: "Sautéed mushrooms, melted Swiss cheese, and caramelized onions",
        price: 9.99,
        image: "🍄",
        category: "Specialty",
        nutrition: Nutrition(calories: 550, protein: 33, carbs: 43, fat: 26, sugar: 9, fiber: 3)
    ),
    Burger(
        name: "Western Burger",
        description: "Fried onion strings, bacon, cheddar cheese, and BBQ sauce",
        price: 10.99,
        image: "🤠",
        category: "Specialty",
        nutrition: Nutrition(calories: 640, protein: 36, carbs: 52, fat: 30, sugar: 12, fiber: 2)
    ),
    Burger(
        name: "Veggie Burger",
        description: "Plant-based patty with fresh vegetables and special vegan sauce",
        price: 9.49,
        image: "🥬",
        category: "Vegan",
        nutrition: Nutrition(calories: 380, protein: 18, carbs: 48, fat: 12, sugar: 6, fiber: 8)
    ),
    Burger(
        name: "Turkey Burger",
        description: "Lean ground turkey with lettuce, tomato, and avocado",
        price: 8.99,
        image: "🦃",
        category: "Healthy",
        nutrition: Nutrition(calories: 420, protein: 40, carbs: 38, fat: 14, sugar: 5, fiber: 3)
    ),
    Burger(
        name: "Surf & Turf Burger",
        description: "Beef patty with grilled shrimp, melted provolone, and garlic aioli",
        price: 13.99,
        image: "🦐",
        category: "Premium",
        nutrition: Nutrition(calories: 680, protein: 52, carbs: 42, fat: 28, sugar: 8, fiber: 2)
    ),
    Burger(
        name: "Triple Stack",
        description: "Three beef patties, three slices of cheese, lettuce, tomato, and pickles",
        price: 14.99,
        image: "🏗️",
        category: "Premium",
        nutrition: Nutrition(calories: 1020, protein: 64, carbs: 56, fat: 56, sugar: 12, fiber: 3)
    )
]
