message(0xAAAABBBB) EmptyMsg {}

contract EmptyMsgField {
  m: EmptyMsg;

  init() {
    self.m = EmptyMsg{};
  }
}
