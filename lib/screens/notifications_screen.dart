import 'package:bonless61/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: Colors.red, size: 28)),

                  const SizedBox(width: 12),

                  // Title + subtitle
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Notifications',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Orders, rewards, and account updates',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Mark all read
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'MARK ALL',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.done_all, color: Colors.red, size: 20),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'READ',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      NotificationFilterChips(),
                      SizedBox(height: 12),
                      NotificationCard(
                        icon: Icons.motorcycle,
                        title: 'Order is out for delivery',
                        message:
                            'Your order B-13 is out for delivery and should arrive in 18-25 min.',
                        isNew: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationFilterChips extends StatelessWidget {
  const NotificationFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          FilterChipItem(title: 'ALL', isSelected: true),
          SizedBox(width: 12),
          FilterChipItem(title: 'ORDERS'),
          SizedBox(width: 12),
          FilterChipItem(title: 'OFFERS'),
          SizedBox(width: 12),
          FilterChipItem(title: 'REWARDS'),
        ],
      ),
    );
  }
}

class FilterChipItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const FilterChipItem({
    super.key,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryRed : const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.white54,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final bool isNew;
  final VoidCallback? onTap;

  const NotificationCard({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    required this.isNew,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isNew
                ? const Color.fromRGBO(31, 31, 31, 1)
                : const Color.fromRGBO(24, 24, 24, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: isNew
                      ? const Color.fromRGBO(53, 53, 53, 1)
                      : const Color.fromRGBO(40, 40, 40, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: isNew ? AppColors.primaryRed : Colors.white38,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: isNew ? Colors.white : Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (isNew) ...[
                      const SizedBox(height: 6),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryRed,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                    const SizedBox(height: 6),
                    Text(
                      message,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: isNew ? Colors.white54 : Colors.white38,
                        fontSize: 14,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}