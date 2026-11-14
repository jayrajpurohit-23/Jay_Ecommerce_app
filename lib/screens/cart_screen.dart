
import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  final CartProvider cartProvider;

  const CartScreen({
    super.key,
    required this.cartProvider,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: cartProvider,
      builder: (context, child) {
        final cartProducts = products
            .where((product) =>
            cartProvider.cart.containsKey(product.id))
            .toList();

        final subtotal = cartProvider.getTotal(products);
        final delivery = cartProducts.isEmpty ? 0.0 : 0.0;
        final total = subtotal + delivery;

        return Scaffold(
          backgroundColor: const Color(0xFFF7F7FB),

          // APP BAR
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF25213A),
            elevation: 0,
            title: const Text(
              'My Cart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
          ),

          body: cartProducts.isEmpty
              ? _buildEmptyCart(context)
              : LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 750;

              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: _buildCartItems(
                          context, cartProducts),
                    ),
                    SizedBox(
                      width: 320,
                      child: _buildSummary(
                        context,
                        subtotal,
                        delivery,
                        total,
                      ),
                    ),
                  ],
                );
              }

              return Column(
                children: [
                  Expanded(
                    child: _buildCartItems(
                        context, cartProducts),
                  ),
                  _buildSummary(
                    context,
                    subtotal,
                    delivery,
                    total,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  // CART PRODUCTS
  Widget _buildCartItems(
      BuildContext context,
      List<Product> cartProducts,
      ) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Shopping Items',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${cartProvider.totalItems} Items',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),

        const SizedBox(height: 15),

        ...cartProducts.map(
              (product) => _buildProductCard(context, product),
        ),
      ],
    );
  }

  // PRODUCT CARD
  Widget _buildProductCard(
      BuildContext context,
      Product product,
      ) {
    final quantity = cartProvider.cart[product.id]!;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // PRODUCT IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Container(
              width: 95,
              height: 105,
              color: const Color(0xFFF7F7FB),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.image_not_supported_outlined,
                    size: 40,
                    color: Colors.grey,
                  );
                },
              ),
            ),
          ),

          const SizedBox(width: 13),

          // PRODUCT DETAILS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF25213A),
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  '₹${product.price.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF673AB7),
                  ),
                ),

                const SizedBox(height: 10),

                // QUANTITY CONTROLS
                Row(
                  children: [
                    _quantityButton(
                      icon: Icons.remove,
                      onTap: () {
                        cartProvider.decreaseQuantity(product);
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 13,
                      ),
                      child: Text(
                        '$quantity',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    _quantityButton(
                      icon: Icons.add,
                      onTap: () {
                        cartProvider.increaseQuantity(product);
                      },
                    ),

                    const Spacer(),

                    IconButton(
                      onPressed: () {
                        cartProvider.removeFromCart(product);
                      },
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                      tooltip: 'Remove product',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // QUANTITY BUTTON
  Widget _quantityButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: const Color(0xFFEDE7F6),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 17,
          color: const Color(0xFF673AB7),
        ),
      ),
    );
  }

  // ORDER SUMMARY
  Widget _buildSummary(
      BuildContext context,
      double subtotal,
      double delivery,
      double total,
      ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(22),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Order Summary',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF25213A),
            ),
          ),

          const SizedBox(height: 18),

          _summaryRow('Subtotal', subtotal),

          const SizedBox(height: 10),

          _summaryRow('Delivery Charges', delivery),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Amount',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '₹${total.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF673AB7),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // CHECKOUT BUTTON
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: () {
                _placeOrder(context, total);
              },
              icon: const Icon(Icons.lock_outline),
              label: const Text(
                'Proceed to Checkout',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF673AB7),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          const Center(
            child: Text(
              'Secure Shopping Experience',
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // SUMMARY ROW
  Widget _summaryRow(String title, double amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        Text(
          '₹${amount.toStringAsFixed(0)}',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // EMPTY CART
  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: Color(0xFFEDE7F6),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_cart_outlined,
                size: 75,
                color: Color(0xFF673AB7),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Your Cart is Empty!',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF25213A),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Looks like you haven\'t added anything\nto your shopping cart yet.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.shopping_bag_outlined),
              label: const Text('Continue Shopping'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF673AB7),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // CHECKOUT ACTION
  void _placeOrder(BuildContext context, double total) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 65,
              ),

              const SizedBox(height: 15),

              const Text(
                'Order Confirmed!',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Your demo order has been placed successfully.',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              Text(
                'Total: ₹${total.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF673AB7),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    cartProductsClear();
                    Navigator.pop(dialogContext);
                    Navigator.pop(context);
                  },
                  child: const Text('Continue Shopping'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void cartProductsClear() {
    for (final product in products) {
      cartProvider.removeFromCart(product);
    }
  }
}
