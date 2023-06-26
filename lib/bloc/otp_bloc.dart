import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_field/bloc/otp_event.dart';
import 'package:otp_field/bloc/otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpState(List.generate(4, (index) => ""))) {
    on<OtpNumberEntered>((event, emit) {
      final currentState = state.otpDigits.toList();
      final emptyIndex = currentState.indexWhere((element) => element.isEmpty);
      if (emptyIndex >= 0) {
        currentState[emptyIndex] = event.number;
        emit(OtpState(currentState));
      }
    });
    on<OtpBackspacePressed>((event, emit) {
      final currentState = state.otpDigits.toList();
      final lastIndex =
          currentState.lastIndexWhere((element) => element.isNotEmpty);
      if (lastIndex >= 0) {
        currentState[lastIndex] = "";
        emit(OtpState(currentState));
      }
    });
  }
}
