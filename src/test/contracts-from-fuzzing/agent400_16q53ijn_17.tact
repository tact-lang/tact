message(0x2) MsgB {}

struct WrapOpt {
  m: MsgB?;
}

contract MsgOptWrapTest {
  wrapper: WrapOpt = WrapOpt{ m: null };
  init() {}
}