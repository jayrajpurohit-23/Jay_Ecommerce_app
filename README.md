# 🛍️ Jay Store App

A modern and responsive Shopping Cart Application developed using **Flutter and Dart** as part of the Mobile Application Development Lab Mini Project.

The application provides a simple e-commerce shopping experience where users can browse products, view product details, add products to their cart, manage quantities, and calculate the total purchase amount.

---

## 📱 Project Overview

The Shopping Cart App demonstrates the implementation of fundamental Flutter concepts, including widgets, layouts, navigation, state management, reusable components, and local image assets.

### ✨ Features

- 🛒 **Product Listing:** Browse a collection of products.
- 🖼️ **Custom Product Images:** Display locally stored product images.
- 🔍 **Product Search:** Search products by name.
- ❤️ **Wishlist UI:** Mark products as favorites.
- ➕ **Add to Cart:** Add products to the shopping cart.
- 🔢 **Quantity Management:** Increase or decrease product quantities.
- 🗑️ **Remove Products:** Remove selected products from the cart.
- 💰 **Dynamic Price Calculation:** Automatically calculate the total amount.
- 📋 **Order Summary:** View subtotal, delivery charges, and total.
- 📦 **Checkout Interface:** Demonstration order confirmation.
- 📱 **Responsive UI:** Adaptable layouts for different screen sizes.

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Flutter | Mobile application development |
| Dart | Programming language |
| Material Design | User interface |
| ChangeNotifier | State management |
| Android Studio | Development environment |

---

## 📂 Project Structure

```text
flutter-shopping-cart-app/
│
├── assets/
│   └── images/
│       ├── mac_neo.jpg
│       ├── mac_studio.jpg
│       ├── keyboard.jpg
│       ├── mouse.jpg
│       └── duo.jpg
│
├── lib/
│   ├── main.dart
│   │
│   ├── models/
│   │   └── product.dart
│   │
│   ├── data/
│   │   └── product_data.dart
│   │
│   ├── providers/
│   │   └── cart_provider.dart
│   │
│   ├── screens/
│   │   ├── home_screen.dart
│   │   └── cart_screen.dart
│   │
│   └── widgets/
│       └── product_card.dart
│
├── pubspec.yaml
└── README.md
```

---

## 🚀 Getting Started

Follow these instructions to run the project locally.

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or VS Code
- Android Emulator or Chrome Browser

### 1. Clone the Repository

```bash
git clone https://github.com/jayrajpurohit-23/Jay_Ecommerce_app.git
```

### 2. Navigate to Project Directory

```bash
cd flutter-shopping-cart-app
```

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Run the Application

```bash
flutter run
```

To run in Chrome:

```bash
flutter run -d chrome
```

---

## 🖼️ Screenshots

Add your application screenshots here.

| Home Screen | Product Listing |
|---|---|
| <img width="632" height="908" alt="Screenshot 2026-11-14 194938" src="https://github.com/user-attachments/assets/ccdb5778-15de-4ee3-9182-b50f1dceff64" /> | <img width="630" height="909" alt="Screenshot 2026-11-14 194929" src="https://github.com/user-attachments/assets/0b010a90-5d95-4fc9-9ed0-d17915c268f2" /> |

| Shopping Cart | Order Summary |
|---|---|
| <img width="620" height="899" alt="Screenshot 2026-11-14 194918" src="https://github.com/user-attachments/assets/5eaff2a4-d627-4719-aa97-6994e44547c5" /> |<img width="629" height="902" alt="Screenshot 2026-11-14 194827" src="https://github.com/user-attachments/assets/5cf8bb14-51b4-4df1-9cc3-2475c25d6679" />
 | <img width="635" height="916" alt="Screenshot 2026-11-14 200216" src="https://github.com/user-attachments/assets/4b8b5ca9-c8df-455c-b869-53050e1c52e7" /> |

---

## 🧠 Flutter Concepts Demonstrated

- StatelessWidget and StatefulWidget
- Scaffold and AppBar
- GridView.builder and ListView
- Image.asset
- Navigator.push
- MaterialPageRoute
- ChangeNotifier and notifyListeners()
- AnimatedBuilder
- setState()
- LayoutBuilder
- Reusable custom widgets

---

## 🎯 Project Objective

The primary objective of this project is to understand and implement Flutter application development concepts through a practical shopping cart application.

It demonstrates how to build an interactive user interface, manage application state, handle user interactions, and perform dynamic calculations.

---

## 🔮 Future Enhancements

- User authentication and registration
- Product categories and filtering
- SQLite database integration
- Backend API integration
- Persistent shopping cart
- Order history
- Payment gateway integration
- Product ratings and reviews

---

## ⚠️ Disclaimer

This is an educational mini project developed for learning and academic demonstration purposes. The checkout functionality is currently a demo and does not process real payments or create backend orders.

---

## 👨‍💻 Author

**Jay Rajpurohit**

Flutter & Dart Developer

GitHub: [Your GitHub Profile](https://github.com/jayrajpurohit-23)

---

## 📄 License

This project is created for educational purposes. You may add an appropriate open-source license if you intend to distribute or reuse the project.

---

⭐ If you find this project useful, consider giving the repository a star!# Jay_Ecommerce_app
A modern Flutter Shopping Cart application featuring product listings, local images, search, cart management, quantity controls, and dynamic price calculation.
