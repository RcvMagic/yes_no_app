import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textEditController = TextEditingController();
    final FocusNode focusNode = FocusNode();
    //final chatProvider = context.read<ChatProvider>();

    return TextFormField(
      decoration: InputDecoration(
          hintText: 'End your message with a ?',
          filled: true,
          suffixIcon: IconButton(
            onPressed: () {
              final textValue = textEditController.value.text;
              onValue(textValue);
              textEditController.clear();
            },
            icon: const Icon(Icons.send_outlined),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      onFieldSubmitted: (value) {
        onValue(value);
        textEditController.clear();
        focusNode.requestFocus();
      },
      controller: textEditController,
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
    );
  }
}
