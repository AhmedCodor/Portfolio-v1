import 'package:flutter/material.dart';
import 'package:portfolio/src/models/service.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';

class ServiceCard extends StatefulWidget {
  final Service serviceModel;
  const ServiceCard({Key? key, required this.serviceModel}) : super(key: key);

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isCardHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState.call(() => _isCardHovered = true),
      onExit: (event) => setState.call(() => _isCardHovered = false),
      child: _buildCard(),
    );
  }

  Widget _buildCard(){
    const Duration _serviceCardAnimDur = Duration(milliseconds: 200);
    const double _height = 210;
    const double _width = 210;
    return AnimatedContainer(
      padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h, bottom: 5.h),
      duration: _serviceCardAnimDur,
      decoration: BoxDecoration(
        color: _isCardHovered ? kwhite : Theme.of(context).primaryColor,
        boxShadow: _isCardHovered ? [
          BoxShadow(
            offset: Offset(30.w, 30.w),
            blurRadius: 0,
            color: const Color(0x99FFFFFF)
          )
        ] : null
      ),
      width: _isCardHovered ? _width + 50 : _width,
      height: _height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/${widget.serviceModel.illustration}',
            height: 60,
            color: _isCardHovered ? Theme.of(context).primaryColor : kblack,
          ),
          const SizedBox(height: 10),
          Txt(txt: widget.serviceModel.name, fontFam: 'boldPoppins', size: 18, clr: _isCardHovered ? kblack : kwhite, isAnimted: true),
          const SizedBox(height: 4),
          Txt(txt: widget.serviceModel.description, size: 14, clr: _isCardHovered ? kblack : kwhite, isAnimted: true, fontFam: 'semiBoldPoppins'),
          // const SizedBox(height: 4),
        ],
      )
    );
  }
}
