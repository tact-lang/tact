message TestMsg {
  foo: Int;
}

contract MsgAsState {
  m: TestMsg;

  init() {
    self.m = TestMsg{foo: 1};
  }
}