message(0xdead) MsgTest {
  foo: Int;
}

contract OptMsgHolder {
  optMsg: MsgTest? = null;

  init() {
    self.optMsg = MsgTest{ foo: 999 };
  }
}