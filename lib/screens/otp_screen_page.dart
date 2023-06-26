import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_field/bloc/otp_bloc.dart';
import 'package:otp_field/bloc/otp_state.dart';
import 'package:otp_field/widget/number_keypad.dart';

class OtpScreenPage extends StatelessWidget {
  final _otpSymbols = ["\u{25CB}", "\u{25CB}", "\u{25CB}", "\u{25CB}"];

  OtpScreenPage({super.key});

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
                  const NumberKeypad(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
