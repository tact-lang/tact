struct MsgB {
  f: String;
}
message MsgWrapper {
  m: MsgB;
}

contract TestContract {
  msgWrap: MsgWrapper;
  init() {
    self.msgWrap = MsgWrapper{ m: MsgB{f: "msg"} };
  }
}