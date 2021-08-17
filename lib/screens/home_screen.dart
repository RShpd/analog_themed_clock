import 'package:analog_clock/size_config.dart';
import 'package:analog_clock/widgets/digital_clock_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: buildAppBarWidget(context),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Tehran, IR | PST',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            DigitalClockWidget(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBarWidget(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/Settings.svg'),
        color: Theme.of(context).iconTheme.color,
        onPressed: () {},
      ),
      actions: [AddButtonWidget()],
    );
  }
}

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      width: getProportionateScreenWidth(32),
      child: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white70),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
