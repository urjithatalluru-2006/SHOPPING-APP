import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cardController = TextEditingController();

  int _selectedPaymentMethod = 0;
  bool _placingOrder = false;

  final List<Map<String, dynamic>> _paymentMethods = [
    {'title': 'Credit / Debit Card', 'icon': Icons.credit_card_rounded},
    {'title': 'Apple / Google Pay', 'icon': Icons.phone_iphone_rounded},
    {'title': 'Cash on Delivery', 'icon': Icons.local_atm_rounded},
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _cardController.dispose();
    super.dispose();
  }

  Future<void> _placeOrder() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _placingOrder = true);
    await Future.delayed(const Duration(milliseconds: 1400)); // simulate checkout

    if (!mounted) return;
    context.read<CartProvider>().clearCart();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        contentPadding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
        content: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: const Duration(milliseconds: 500),
          curve: Curves.elasticOut,
          builder: (context, value, child) =>
              Transform.scale(scale: value, child: child),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8F5E9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_circle_rounded,
                    color: Color(0xFF2E7D32), size: 48),
              ),
              const SizedBox(height: 16),
              const Text(
                'Order Placed Successfully!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  color: AppTheme.dark,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Thank you for shopping with ShopEase Luxe. Your tracking details have been sent to your email.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: AppTheme.muted, height: 1.4),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: const Text('Back to Boutique'),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    setState(() => _placingOrder = false);
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(title: const Text('Secure Checkout')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Order Summary Mini Banner
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFEDE8E5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.shopping_bag_outlined,
                            color: AppTheme.primary, size: 22),
                        const SizedBox(width: 10),
                        Text(
                          '${cart.itemCount} items in bag',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Text(
                      '\$${cart.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: AppTheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),

              // Shipping Address Section
              const Text(
                'Shipping Address',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.dark,
                ),
              ),
              const SizedBox(height: 12),
              CustomTextField(
                controller: _nameController,
                label: 'Full Recipient Name',
                icon: Icons.person_outline_rounded,
                validator: (value) => (value == null || value.trim().length < 3)
                    ? 'Enter recipient full name'
                    : null,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                controller: _addressController,
                label: 'Street Address, Apt / Suite',
                icon: Icons.home_outlined,
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Shipping address is required'
                    : null,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                controller: _phoneController,
                label: 'Mobile Contact Number',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  final digits = value?.replaceAll(RegExp(r'\D'), '') ?? '';
                  if (digits.length < 10) return 'Enter a valid 10-digit phone number';
                  return null;
                },
              ),
              const SizedBox(height: 26),

              // Payment Method Section
              const Text(
                'Payment Method',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.dark,
                ),
              ),
              const SizedBox(height: 12),
              Column(
                children: List.generate(_paymentMethods.length, (i) {
                  final method = _paymentMethods[i];
                  final isSelected = i == _selectedPaymentMethod;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: () => setState(() => _selectedPaymentMethod = i),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected
                                ? AppTheme.primary
                                : const Color(0xFFEDE8E5),
                            width: isSelected ? 1.8 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(method['icon'] as IconData,
                                color: isSelected
                                    ? AppTheme.primary
                                    : AppTheme.dark),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Text(
                                method['title'] as String,
                                style: TextStyle(
                                  fontWeight: isSelected
                                      ? FontWeight.w700
                                      : FontWeight.w500,
                                  color: AppTheme.dark,
                                ),
                              ),
                            ),
                            Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected
                                      ? AppTheme.primary
                                      : const Color(0xFFC4BCB8),
                                  width: isSelected ? 6.5 : 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),

              if (_selectedPaymentMethod == 0) ...[
                const SizedBox(height: 8),
                CustomTextField(
                  controller: _cardController,
                  label: 'Card Number (16 Digits)',
                  icon: Icons.credit_card_rounded,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    final digits = value?.replaceAll(RegExp(r'\D'), '') ?? '';
                    if (digits.length != 16) {
                      return 'Card number must contain 16 digits';
                    }
                    return null;
                  },
                ),
              ],

              const SizedBox(height: 28),
              _placingOrder
                  ? const Center(
                      child: CircularProgressIndicator(color: AppTheme.primary))
                  : CustomButton(
                      label: 'Place Order • \$${cart.totalPrice.toStringAsFixed(2)}',
                      icon: Icons.lock_outline_rounded,
                      onPressed: _placeOrder,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
