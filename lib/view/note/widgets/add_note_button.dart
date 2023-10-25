import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'package:notes_app/app_style.dart';
import 'package:notes_app/my_flutter_app_icons.dart';
import 'package:notes_app/view/note/screens/create_note.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({
    Key? key,
    required this.colorId,
  }) : super(key: key);

  final int colorId;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openElevation: 4,
      transitionType: ContainerTransitionType.fade,
      closedElevation: 0,
      tappable: false,
      closedColor: AppStyle.cardsColor[colorId],
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      closedBuilder: (context, action) {
        return FloatingActionButton(
          backgroundColor: AppStyle.buttonColor,
          onPressed: action,
          child: const Icon(MyFlutterApp.plus),
        );
      },
      openBuilder: (
        BuildContext _,
        CloseContainerActionCallback closeContainer,
      ) {
        return const CreateNoteScreen();
      },
    );
  }
}
