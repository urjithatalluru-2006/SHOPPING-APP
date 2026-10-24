import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String brand;
  final String category;
  final double price;
  final double originalPrice;
  final double rating;
  final int reviewCount;
  final String emoji;
  final String imageUrl;
  final String description;
  final String tag;
  final List<String> sizes;
  final List<Color> colors;

  const Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.category,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.reviewCount,
    required this.emoji,
    required this.imageUrl,
    required this.description,
    this.tag = '',
    this.sizes = const ['S', 'M', 'L'],
    this.colors = const [Color(0xFFE85D75), Color(0xFF2B2D42), Color(0xFFD4AF37)],
  });

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
  String get formattedOriginalPrice => '\$${originalPrice.toStringAsFixed(2)}';
  int get discountPercent =>
      (((originalPrice - price) / originalPrice) * 100).round();
}

// Fashion & Beauty Catalog: Dresses, Makeup, Skincare, Accessories
final List<Product> sampleProducts = [
  const Product(
    id: 'p1',
    name: 'Silk Evening Slip Dress',
    brand: 'AURA ATELIER',
    category: 'Dresses',
    price: 89.00,
    originalPrice: 129.00,
    rating: 4.9,
    reviewCount: 142,
    emoji: '👗',
    imageUrl:
        'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=800&auto=format&fit=crop&q=80',
    tag: 'BESTSELLER',
    sizes: ['XS', 'S', 'M', 'L'],
    colors: [Color(0xFFD4AF37), Color(0xFF1E1E24), Color(0xFFE8998D)],
    description:
        'Crafted from 100% pure mulberry silk satin. Features a draped cowl neckline, graceful bias-cut silhouette, and delicate adjustable shoulder straps for effortless gala elegance.',
  ),
  const Product(
    id: 'p2',
    name: 'Velvet Matte Luxe Lipstick',
    brand: "L'ÉLIXIR BEAUTÉ",
    category: 'Makeup',
    price: 29.50,
    originalPrice: 38.00,
    rating: 4.9,
    reviewCount: 380,
    emoji: '💄',
    imageUrl:
        'https://images.unsplash.com/photo-1586495777744-4413f21062fa?w=800&auto=format&fit=crop&q=80',
    tag: 'TRENDING',
    sizes: ['Standard 3.8g'],
    colors: [Color(0xFFBA1331), Color(0xFFC75D6E), Color(0xFF8B263E), Color(0xFFE07A5F)],
    description:
        'A high-pigment, weightless matte formula infused with hyaluronic spheres and Moroccan argan oil. Delivers 16-hour cushiony comfort with an airbrushed soft-focus finish.',
  ),
  const Product(
    id: 'p3',
    name: 'Hydra-Barrier Peptide Serum',
    brand: 'BOTANICA LAB',
    category: 'Skincare',
    price: 54.00,
    originalPrice: 72.00,
    rating: 4.8,
    reviewCount: 295,
    emoji: '🧴',
    imageUrl:
        'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=800&auto=format&fit=crop&q=80',
    tag: 'DERM PICK',
    sizes: ['30ml', '50ml'],
    colors: [Color(0xFFE3F2FD), Color(0xFFD7CCC8)],
    description:
        'Concentrated multi-peptide elixir designed to instantly quench thirsty skin, fortify the lipid moisture barrier, and visibly restore luminous bounce.',
  ),
  const Product(
    id: 'p4',
    name: 'Romantic Floral Chiffon Dress',
    brand: 'MAISON FLEUR',
    category: 'Dresses',
    price: 68.00,
    originalPrice: 95.00,
    rating: 4.8,
    reviewCount: 118,
    emoji: '🌸',
    imageUrl:
        'https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?w=800&auto=format&fit=crop&q=80',
    tag: 'NEW',
    sizes: ['S', 'M', 'L', 'XL'],
    colors: [Color(0xFFF7CAD0), Color(0xFFC77DFF), Color(0xFFDEE2E6)],
    description:
        'Float into the sunshine with dreamy floral prints on gossamer chiffon. Styled with a sweetheart corset-style bodice, tiered flutter hemline, and hidden pockets.',
  ),
  const Product(
    id: 'p5',
    name: 'Rose Gold Foil Eyeshadow Palette',
    brand: 'GLOWLAB COSMETICS',
    category: 'Makeup',
    price: 44.00,
    originalPrice: 58.00,
    rating: 4.9,
    reviewCount: 215,
    emoji: '✨',
    imageUrl:
        'https://images.unsplash.com/photo-1512496015851-a90fb38ba796?w=800&auto=format&fit=crop&q=80',
    tag: 'POPULAR',
    sizes: ['14 Pan Palette'],
    colors: [Color(0xFFB76E79), Color(0xFFD4AF37), Color(0xFF4A154B)],
    description:
        '14 buttery-smooth shades ranging from velvety matte transition tones to molten metallic foils and multidimensional diamond shimmer toppers.',
  ),
  const Product(
    id: 'p6',
    name: 'Quilted Leather Chain Crossbody',
    brand: 'VALENTINE PARIS',
    category: 'Accessories',
    price: 139.00,
    originalPrice: 185.00,
    rating: 5.0,
    reviewCount: 88,
    emoji: '👜',
    imageUrl:
        'https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=800&auto=format&fit=crop&q=80',
    tag: 'LUXURY',
    sizes: ['Small (22cm)', 'Medium (26cm)'],
    colors: [Color(0xFF1E1E24), Color(0xFFF7ECE1), Color(0xFF8B263E)],
    description:
        'Supple diamond-quilted vegan nappa leather finished with champagne gold chain hardware, turn-lock closure, and dual interior accordion compartments.',
  ),
  const Product(
    id: 'p7',
    name: 'Emerald Velvet Cocktail Dress',
    brand: 'NOIR COUTURE',
    category: 'Dresses',
    price: 115.00,
    originalPrice: 159.00,
    rating: 4.9,
    reviewCount: 164,
    emoji: '✨',
    imageUrl:
        'https://images.unsplash.com/photo-1566174053879-31528523f8ae?w=800&auto=format&fit=crop&q=80',
    tag: 'TRENDING',
    sizes: ['XS', 'S', 'M', 'L'],
    colors: [Color(0xFF0F3B2E), Color(0xFF2A1B3D), Color(0xFF800020)],
    description:
        'Plush jewel-toned stretch velvet sculpted with an asymmetric neckline, thigh-high slit, and gathered ruched waistline for red-carpet allure.',
  ),
  const Product(
    id: 'p8',
    name: 'Dewy Pinch Liquid Blush',
    brand: 'PETAL TOKYO',
    category: 'Makeup',
    price: 24.00,
    originalPrice: 32.00,
    rating: 4.7,
    reviewCount: 310,
    emoji: '💖',
    imageUrl:
        'https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=800&auto=format&fit=crop&q=80',
    tag: 'VIRAL',
    sizes: ['15ml Bottle'],
    colors: [Color(0xFFFF758F), Color(0xFFFFB3C6), Color(0xFFE27396)],
    description:
        'A featherweight serum blush that melts seamlessly over bare skin or makeup. Infused with white tea extract and squalane for a youthful luminous flush.',
  ),
  const Product(
    id: 'p9',
    name: 'Golden Glow Botanical Face Oil',
    brand: 'SOLIS PURE',
    category: 'Skincare',
    price: 48.00,
    originalPrice: 62.00,
    rating: 4.8,
    reviewCount: 172,
    emoji: '✨',
    imageUrl:
        'https://images.unsplash.com/photo-1608248597359-5633842183c5?w=800&auto=format&fit=crop&q=80',
    tag: 'ORGANIC',
    sizes: ['30ml'],
    colors: [Color(0xFFFFF3CD)],
    description:
        'A golden cold-pressed blend of organic rosehip seed, Kalahari melon, and marula oils. Seals in hydration and delivers an ethereal morning glow.',
  ),
  const Product(
    id: 'p10',
    name: 'Baroque Pearl Chandelier Earrings',
    brand: 'LUMEN JEWEL',
    category: 'Accessories',
    price: 42.00,
    originalPrice: 56.00,
    rating: 4.9,
    reviewCount: 97,
    emoji: '🦪',
    imageUrl:
        'https://images.unsplash.com/photo-1535632066927-ab7c9ab60908?w=800&auto=format&fit=crop&q=80',
    tag: 'HANDMADE',
    sizes: ['One Size'],
    colors: [Color(0xFFFFD700), Color(0xFFE0E0E0)],
    description:
        'Lustrous natural baroque freshwater pearls suspended from 18K gold vermeil hoops. Lightweight, hypoallergenic, and gracefully moves with every step.',
  ),
];
