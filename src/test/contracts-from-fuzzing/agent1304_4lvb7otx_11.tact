message(1) EmptyMsg {}

contract MsgFieldTest {
  m: EmptyMsg;

  init() {
    self.m = EmptyMsg{};
  }
}