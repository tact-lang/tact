message(42) EmptyMessage {}

contract MsgPersist {
  m: EmptyMessage;
  init() {
    self.m = EmptyMessage{};
  }
  receive() {}
}