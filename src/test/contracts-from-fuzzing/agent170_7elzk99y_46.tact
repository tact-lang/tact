message(0xAA) TestMsg {
  val: Int;
}

contract OptMsgOverride {
  data: TestMsg? = null;

  init() {
    self.data = TestMsg{ val: 10 };
  }
}