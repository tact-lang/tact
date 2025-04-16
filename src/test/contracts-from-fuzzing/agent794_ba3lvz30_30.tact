message(0x1234) MsgType {
  x: Int;
  y: Bool;
}

contract MessageField {
  data: MsgType;

  init() {
    self.data = MsgType{
      x: 99,
      y: true
    };
  }
}
