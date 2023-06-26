import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_field/bloc/otp_bloc.dart';
import 'package:otp_field/bloc/otp_event.dart';
import 'package:otp_field/bloc/otp_state.dart';

class OtpScreenPage extends StatelessWidget {
  final _otpSymbols = ["\u{25CB}", "\u{25CB}", "\u{25CB}", "\u{25CB}"];

  OtpScreenPage({super.key});

  Widget buildNumberButtonsRow(BuildContext context, List<String> numbers) {
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
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (_) => OtpBloc(),
        child: BlocBuilder<OtpBloc, OtpState>(
          builder: (context, state) {
            for (int i = 0; i < state.otpDigits.length; i++) {
              _otpSymbols[i] =
                  state.otpDigits[i].isEmpty ? "\u{25CB}" : "\u{25CF}";
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Enter Groww PIN",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "raghunbaplayer@gmail.com",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              _otpSymbols[0],
                              style: const TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            Text(
                              _otpSymbols[1],
                              style: const TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            Text(
                              _otpSymbols[2],
                              style: const TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            Text(
                              _otpSymbols[3],
                              style: const TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.w200,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.blue[50],
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: <Widget>[
                        buildNumberButtonsRow(context, ['1', '2', '3']),
                        buildNumberButtonsRow(context, ['4', '5', '6']),
                        buildNumberButtonsRow(context, ['7', '8', '9']),
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
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
