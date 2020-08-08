import "package:flutter/material.dart";
import "package:doctorApp/config/palette.dart";

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.primaryBlue,
      elevation: 0.0,
      leading: Text("HealthBag",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
