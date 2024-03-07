// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:d_input/d_input.dart';
import 'package:flutter/material.dart';

class SimpleInput extends StatelessWidget {
  final String actionTitle;
  final VoidCallback actionButton;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  const SimpleInput({
    Key? key,
    required this.actionTitle,
    required this.actionButton,
    required this.titleController,
    required this.descriptionController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DInput(
          controller: titleController,
          title: 'Title',
        ),
        DInput(
          controller: descriptionController,
          title: 'Description',
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(onPressed: actionButton, child: Text(actionTitle))
      ],
    );
  }
}
