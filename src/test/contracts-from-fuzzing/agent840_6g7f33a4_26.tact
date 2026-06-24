message(1) Note {
  text: String;
}

struct WrapMsg {
  note: Note?;
}

contract ParamTest(
  param: WrapMsg,
) {}
