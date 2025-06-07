struct MsgWrap {
  m: MessageTest;
}

message(0x12345678) MessageTest {
  id: Int as uint32;
  text: String;
}

contract MessageFieldTest {
  wrapped: MsgWrap;

  init() {
    self.wrapped = MsgWrap { m: MessageTest { id:1, text:"hi" } };
  }
}