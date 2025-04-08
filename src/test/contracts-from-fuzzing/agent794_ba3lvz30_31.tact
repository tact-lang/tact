message(0x2222) MyMsg {
  x: Int;
}

contract OptMsgField {
  data: MyMsg?;

  init() {
    self.data = null;
  }
}
