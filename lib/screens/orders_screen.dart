import 'package:bonless61/core/theme/app_colors.dart';
import 'package:bonless61/wigets/widgetexport.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                const TrackOrderCard(
                  orderId: '#B61-2048',
                  date: '12 NOV 2025',
                  itemsText: '2x Boneless · 1x Fries · 1x Drink',
                  status: 'ON THE WAY',
                  currentStep: 2,
                ),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'PAST ORDERS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'VIEW ALL',
                      style: TextStyle(
                        color: AppColors.primaryRed,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const PastOrderCard(
                  orderId: '#B61-2017',
                  date: '08 NOV 2025',
                  itemsText: '1x Burger Boneless · 1x Fries',
                  status: 'DELIVERED',
                ),
                const SizedBox(height: 14),
                const PastOrderCard(
                  orderId: '#B61-1984',
                  date: '04 NOV 2025',
                  itemsText: '1x Classic Bucket · 2x Drinks',
                  status: 'CANCELED',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TrackOrderCard extends StatelessWidget {
  final String orderId;
  final String date;
  final String itemsText;
  final String status;
  final int currentStep;

  const TrackOrderCard({
    super.key,
    required this.orderId,
    required this.date,
    required this.itemsText,
    required this.status,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: const TextStyle(
              color: Colors.white38,
              fontSize: 11,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            orderId,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            itemsText,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          _buildProgressBar(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TRACK ORDER',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primaryRed,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    const steps = [
      'PLACED',
      'PREPARING',
      'ON THE WAY',
      'DELIVERED',
    ];

    return Column(
      children: [
        Row(
          children: List.generate(steps.length * 2 - 1, (index) {
            if (index.isOdd) {
              final lineIndex = index ~/ 2;
              final isActive = lineIndex < currentStep;
              return Expanded(
                child: Container(
                  height: 3,
                  color: isActive
                      ? AppColors.primaryRed
                      : Colors.white12,
                ),
              );
            }

            final stepIndex = index ~/ 2;
            final isActive = stepIndex <= currentStep;

            return Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive
                    ? AppColors.primaryRed
                    : const Color(0xFF2A2A2A),
                border: Border.all(
                  color: isActive
                      ? AppColors.primaryRed
                      : Colors.white24,
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(steps.length, (index) {
            final isActive = index <= currentStep;
            return Expanded(
              child: Text(
                steps[index],
                textAlign: index == 0
                    ? TextAlign.left
                    : index == steps.length - 1
                        ? TextAlign.right
                        : TextAlign.center,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.white38,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class PastOrderCard extends StatelessWidget {
  final String orderId;
  final String date;
  final String itemsText;
  final String status;

  const PastOrderCard({
    super.key,
    required this.orderId,
    required this.date,
    required this.itemsText,
    required this.status,
  });

  bool get isCanceled => status.toUpperCase() == 'CANCELED';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: const TextStyle(
              color: Colors.white38,
              fontSize: 11,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            orderId,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            itemsText,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isCanceled ? 'ORDER CANCELED' : 'VIEW DETAILS',
                style: TextStyle(
                  color: isCanceled ? Colors.white38 : AppColors.primaryRed,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: isCanceled ? const Color(0xFF2A2A2A) : AppColors.primaryRed,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: isCanceled ? Colors.white70 : Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}