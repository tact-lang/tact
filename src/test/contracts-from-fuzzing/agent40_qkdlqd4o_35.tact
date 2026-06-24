message(12345) SpecialMsg {
  val: Int;
}

contract PersistMsgTest {
    m: SpecialMsg;

    init() {
        self.m = SpecialMsg{val: 42};
    }
}