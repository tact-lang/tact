// optional message struct in persistent field
message(0x77) OptionalMsg {
  a: Int;
}

struct Holder {
  m: OptionalMsg?;
}

contract OptionalMsgField {
  data: Holder;

  init() {
    self.data = Holder{ m: null };
  }
}