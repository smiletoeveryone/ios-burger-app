# iOS App Screenshots Mockup Guide

Since we can't directly capture screenshots from headless simulator, here's how to manually capture them:

## Manual Screenshot Capture Steps

### 1. Launch the App
```bash
xcrun simctl launch booted Entropy.app
```

### 2. Take Screenshots

#### Menu View (Browse Burgers)
- **Show**: Main burger list with search bar
- **Hotkey**: `Cmd + S` in simulator
- **Save as**: `screenshots/1_menu_view.png`

#### Burger Detail View
- **Show**: Tap on any burger to see details
- **Display**: Description, nutritional info, "Why You'll Love It" section, quantity selector
- **Save as**: `screenshots/2_burger_detail.png`

#### Cart View
- **Show**: Tap Cart tab with items added
- **Display**: Cart contents with quantities and total price
- **Save as**: `screenshots/3_cart_view.png`

#### Order History
- **Show**: Tap Orders tab
- **Display**: Previous orders with timestamps
- **Save as**: `screenshots/4_orders_view.png`

#### Search Feature
- **Show**: Search functionality with filtered results
- **Save as**: `screenshots/5_search_feature.png`

## Recommended Screenshot Dimensions
- iPhone 17 Pro: 1290 x 2796 pixels (or native simulator resolution)
- Crop to: ~1080 x 2400 pixels for consistency
- Format: PNG (high quality)

## README Integration

Add this section to README.md:

```markdown
## 📸 App Screenshots

### Browse Menu
![Menu View](screenshots/1_menu_view.png)
*Browse through our delicious burger collection with search functionality*

### View Details & Nutrition
![Burger Detail](screenshots/2_burger_detail.png)
*See comprehensive nutritional information and detailed burger descriptions*

### Shopping Cart
![Cart View](screenshots/3_cart_view.png)
*Manage your order with easy quantity adjustment*

### Order History
![Order History](screenshots/4_orders_view.png)
*Track your previous orders*

### Search & Filter
![Search Feature](screenshots/5_search_feature.png)
*Quickly find your favorite burgers*
```

## Tools to Use

### Built-in Xcode Method:
1. Run app in simulator
2. Press `Cmd + S` to save screenshot
3. Screenshots save to Desktop by default

### Using Terminal:
```bash
# Take screenshot
xcrun simctl io booted screenshot ~/screenshot.png

# List available simulators
xcrun simctl list devices
```

### Using GUI:
1. Open Simulator.app
2. Window → Recents
3. Use Xcode → Window → Devices and Simulators

---

For now, create a `screenshots/` directory and manually add your captured images there.
