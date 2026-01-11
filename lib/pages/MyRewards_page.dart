import 'package:flutter/material.dart';
import 'home_page.dart';

class MyRewardsPage extends StatelessWidget {
  const MyRewardsPage({super.key});

  // Figma frame (Pixel 5)
  static const double designW = 393;
  static const double designH = 851;

  // Background gradient
  static const Color topColor = Color(0xFFF8F8F8);
  static const Color bottomColor = Color(0xFF1D5D6D);

  // Header positions (same layout style as GetRewards)
  // Title in your GetRewards was at (105,40). For "My Rewards" it often needs slight left shift,
  // but I'll keep the SAME X unless you want to adjust in figma.
  static const double titleX = 105, titleY = 40;

  // Subtitle (two lines) - keep same starting X/Y as prototype feel
  static const double subX = 70, subY = 86;

  // Coupon dimensions & spacing (same as GetRewards)
  static const double couponW = 329, couponH = 129;
  static const double couponX = 32, couponY = 155;
  static const double couponGap = 16;

  // Inside coupon positions (same as your LAST GetRewards code)
  static const double cTitleRelX = 66 - couponX; // 34
  static const double cTitleRelY = 169 - couponY - 8; // moved up like your last

  static const double cDescRelX =
      98 - couponX - 8; // moved a bit left like your last
  static const double cDescRelY = 211 - couponY; // 56

  // بدل points: ID مكانه كان points
  static const double cIdRelX = 45 - couponX; // 13
  static const double cIdRelY = 244 - couponY + 8; // moved down like your last

  static const double cTimeRelX = 248 - couponX; // 216
  static const double cTimeRelY =
      238 - couponY + 8; // moved down like your last

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final s = size.width / designW;

    final rewards = <MyRewardData>[
      const MyRewardData(
        title: '15% discount',
        subtitle: '15% discount on one purchase',
        idText: 'ID:85326854',
        start: '12 Mar 2026',
        end: '20 Mar 2026',
      ),
      const MyRewardData(
        title: '10 JDs off',
        subtitle: '10 JDs off on one purchase',
        idText: 'ID:67826854',
        start: '21 Mar 2026',
        end: '10 Apr 2026',
      ),
    ];

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.12, 0.83],
            colors: [topColor, bottomColor],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Back arrow
              Positioned(
                left: 8,
                top: 4,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black87),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const HomePage()),
                    );
                  },
                ),
              ),

              // Title
              Positioned(
                left: titleX * s,
                top: titleY * s,
                child: Text(
                  'My Rewards',
                  style: TextStyle(
                    fontFamily: 'Judson',
                    fontSize: 32 * s,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),

              // Subtitle (two lines)
              Positioned(
                left: subX * s,
                top: subY * s,
                child: Text(
                  'Use your reward at checkout\nShow it to the cashier to apply the discount',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Judson',
                    fontSize: 14 * s,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF4A9EB2),
                    height: 1.15,
                  ),
                ),
              ),

              // Coupons
              for (int i = 0; i < rewards.length; i++)
                Positioned(
                  left: couponX * s,
                  top: (couponY + i * (couponH + couponGap)) * s,
                  width: couponW * s,
                  height: couponH * s,
                  child: MyRewardCouponWidget(data: rewards[i], scale: s),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyRewardData {
  final String title;
  final String subtitle;
  final String idText;
  final String start;
  final String end;

  const MyRewardData({
    required this.title,
    required this.subtitle,
    required this.idText,
    required this.start,
    required this.end,
  });
}

class MyRewardCouponWidget extends StatelessWidget {
  const MyRewardCouponWidget({
    super.key,
    required this.data,
    required this.scale,
  });

  final MyRewardData data;
  final double scale;

  static const double titleRelX = MyRewardsPage.cTitleRelX;
  static const double titleRelY = MyRewardsPage.cTitleRelY;

  static const double descRelX = MyRewardsPage.cDescRelX;
  static const double descRelY = MyRewardsPage.cDescRelY;

  static const double idRelX = MyRewardsPage.cIdRelX;
  static const double idRelY = MyRewardsPage.cIdRelY;

  static const double timeRelX = MyRewardsPage.cTimeRelX;
  static const double timeRelY = MyRewardsPage.cTimeRelY;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // مثل GetRewards: بدون ظل
          boxShadow: const [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/coupon.png',
                  fit: BoxFit.cover,
                ),
              ),

              // Title
              Positioned(
                left: titleRelX * scale,
                top: titleRelY * scale,
                width: 210 * scale,
                child: Text(
                  data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Judson',
                    fontSize: 26 * scale,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1D5D6D),
                    height: 1,
                  ),
                ),
              ),

              // Description (single line)
              Positioned(
                left: descRelX * scale,
                top: descRelY * scale,
                width: 230 * scale,
                child: Text(
                  data.subtitle,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Judson',
                    fontSize: 15 * scale,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    height: 1.05,
                  ),
                ),
              ),

              // ID (instead of points)
              Positioned(
                left: idRelX * scale,
                top: idRelY * scale,
                width: 200 * scale,
                child: Text(
                  data.idText,
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontFamily: 'Judson',
                    fontSize: 18 * scale,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF5CA8B9),
                    height: 1,
                  ),
                ),
              ),

              // Time block bottom-right
              Positioned(
                left: timeRelX * scale,
                top: timeRelY * scale,
                width: 105 * scale,
                height: 42 * scale,
                child: _TimeBlock(
                  start: data.start,
                  end: data.end,
                  scale: scale,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimeBlock extends StatelessWidget {
  const _TimeBlock({
    required this.start,
    required this.end,
    required this.scale,
  });

  final String start;
  final String end;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Starts: ',
                style: TextStyle(
                  fontFamily: 'Judson',
                  fontSize: 12 * scale,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: start,
                style: TextStyle(
                  fontFamily: 'Judson',
                  fontSize: 12 * scale,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4 * scale),
        RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Ends: ',
                style: TextStyle(
                  fontFamily: 'Judson',
                  fontSize: 12 * scale,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: end,
                style: TextStyle(
                  fontFamily: 'Judson',
                  fontSize: 12 * scale,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
