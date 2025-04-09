message(12345) EmptyMsg {}

contract OptMsgPersistent {
  m: EmptyMsg?;
  init() {
    self.m = null;
  }
  receive() {}
}