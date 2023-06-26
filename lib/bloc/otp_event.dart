abstract class OtpEvent {}

class OtpNumberEntered extends OtpEvent {
  final String number;

  OtpNumberEntered(this.number);
}

class OtpBackspacePressed extends OtpEvent {}
