import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_field/bloc/otp_bloc.dart';
import 'package:otp_field/bloc/otp_event.dart';

class NumberKeypad extends StatelessWidget {
  const NumberKeypad({super.key});

  Widget _buildNumberButtonsRow(BuildContext context, List<String> numbers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: numbers.map((number) {
        return TextButton(
          onPressed: () {
            BlocProvider.of<OtpBloc>(context).add(OtpNumberEntered(number));
          },
          child: Text(
            number,
            style: const TextStyle(
              fontSize: 40,
              color: Colors.blue,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[50],
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _buildNumberButtonsRow(context, ['1', '2', '3']),
          _buildNumberButtonsRow(context, ['4', '5', '6']),
          _buildNumberButtonsRow(context, ['7', '8', '9']),
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    BlocProvider.of<OtpBloc>(context)
                        .add(OtpBackspacePressed());
                  },
                  child: const Text(
                    '\u{232b}',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<OtpBloc>(context)
                        .add(OtpNumberEntered('0'));
                  },
                  child: const Text(
                    '0',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // _handleSubmit();
                  },
                  child: const Text(
                    '\u{2713}',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
