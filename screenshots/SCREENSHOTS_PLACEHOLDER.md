# Screenshots Directory

This directory contains app screenshots for the README documentation.

## How to Add Screenshots

### Option 1: Manual Capture from Simulator
1. Run the app in iOS simulator: `xcrun simctl launch booted Entropy.app`
2. Press `Cmd + S` to take a screenshot
3. Save each screenshot with the naming convention below

### Option 2: Using Terminal
```bash
# Boot simulator
xcrun simctl boot "iPhone 17 Pro"

# Install and launch app
xcrun simctl install booted /path/to/app.app
xcrun simctl launch booted Entropy.app

# Take screenshot
xcrun simctl io booted screenshot ~/Desktop/screenshot.png
```

### Option 3: Using Script
See SCREENSHOT_GUIDE.md in project root

---

## Screenshot Naming Convention

Please save screenshots with these names:

1. **1_menu_view.png** - Main menu showing burger list with search
2. **2_burger_detail.png** - Detailed view of a burger with nutritional info
3. **3_cart_view.png** - Shopping cart with items
4. **4_orders_view.png** - Order history view
5. **5_search_feature.png** - Search functionality in action

---

## Recommended Screenshot Specifications

| Property | Value |
|----------|-------|
| Device | iPhone 17 Pro |
| Resolution | 1290 x 2796 pixels (native) |
| Format | PNG |
| Quality | High (lossless) |
| Crop | Optional, for consistent aspect ratio |

---

## Adding to README

Once you have screenshots, they will automatically appear in the README.md with this markdown syntax:

```markdown
![Menu View](screenshots/1_menu_view.png)
```

---

## Tips for Better Screenshots

✅ Use the app in a realistic way
✅ Show the main features in action
✅ Include the status bar and home indicator
✅ Use consistent device (iPhone 17 Pro)
✅ Ensure good lighting/contrast
✅ Show different app states (menu, detail, cart, search)

---

**Last Updated:** December 14, 2025
