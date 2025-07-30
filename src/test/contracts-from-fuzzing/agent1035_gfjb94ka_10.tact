struct MessageHolder {
  m: MsgSample;
}

message(0x1) MsgSample {
  foo: Int;
  bar: Bool;
}

contract MessageInsideStruct {
  data: MessageHolder = MessageHolder { m: MsgSample{ foo: 10, bar: true } };
  init() {
    self.data = MessageHolder { m: MsgSample{ foo: 20, bar: false } };
  }
  receive() {}
}