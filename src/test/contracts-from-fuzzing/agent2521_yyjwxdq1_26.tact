message(0xDEADBEEF) SpecialMsg { x: Int }

struct HasOpMsg {
  val: Int;
  m: SpecialMsg;
}

contract MsgOpPersistent {
  f: HasOpMsg;

  init() {
    self.f = HasOpMsg{
      val: 5,
      m: SpecialMsg{ x: 42 }
    };
  }
}
