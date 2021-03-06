// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/state/provider_class.dart';
import 'package:portfolio/src/utils/constants/constansts.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:provider/provider.dart';

import 'custom_text.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    bool _pageIsScrolled = context.read<ProviderClass>().pageScrolled; 
    return SafeArea(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _pageIsScrolled ? Theme.of(context).primaryColor.withOpacity(0.3) // const Color(0xFF010203)
           : ktrans,
          border: _pageIsScrolled ? Border(bottom: BorderSide(color: Colors.grey[400]!)) : null
        ),
        height: kToolbarHeight, //+ MediaQuery.of(context).padding.top + 5,
        child: Row(
          children: [
            const SizedBox(width: 30),
            const Txt(txt: kProjectTitle + '.', fontFam: 'boldPoppins', size: 24),
            const Spacer(),
            (kIsWeb && SizeConfig.isDesktopMQ(context) && !SizeConfig.isMobile())
            ? Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(5, (index) => _buildWebNavItem(index))
            ) : MaterialButton(
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            
              child: const Icon(Icons.menu, color: kwhite, size: 30,),
              color: Theme.of(context).primaryColor,
              hoverColor: kwhite.withOpacity(0.4),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
              minWidth: 30,
              height: 30,

            ),
            const SizedBox(width: 30),
          ],
        ),
      ),
    );
  }

  final List<bool> _interactionStates = [false, false, false, false, false];
  Widget _buildWebNavItem(int index) {
    final _globProvider = Provider.of<ProviderClass>(context);
    final List<String> tabsLabels = ['Home', 'About me', 'My skills', 'My Work', 'Contact'];
    final bool _isSelected = index == _globProvider.getSelectedAppBarIndex;
    final bool _isHovered = _interactionStates[index];
    return InkWell(
      highlightColor: ktrans,
      splashColor: ktrans,
      focusColor: ktrans,
      hoverColor: ktrans,
      splashFactory: NoSplash.splashFactory,
      onHover: (isHovered) {
        setState(() {
          if (isHovered)
            _interactionStates[index] = true;
          else
            _interactionStates[index] = false;
        });
      },
      onTap: () {
        _globProvider.setSelectedAppBarIndex = index;
        _globProvider.setPageScrollingState = false;
      },
      child: Padding(
        padding: EdgeInsets.only(right: (tabsLabels.length == index ? 60 : 10).w),
        child: AnimatedContainer(
          // padding: EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            width: 100,
            child: Center(
              child: Txt(
                isAnimted: true,
                animationDur: const Duration(milliseconds: 250),
                txt: tabsLabels[index],
                fontFam: _isHovered && !_isSelected ? 'boldPoppins' : _isSelected ? 'boldPoppins' : 'regPoppins',
                clr: _isHovered && !_isSelected
                    ? kwhite
                    : _isSelected
                        ? Colors.lightGreen //Theme.of(context).primaryColor
                        : kwhite.withOpacity(0.8),
                size: _isHovered && !_isSelected ? 18 : 15,
              ),
            ),
          ),
          duration: const Duration(milliseconds: 300),
        ),
      ),
    );
  }
}