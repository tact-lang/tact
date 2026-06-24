message EmptyMsg {}

contract EmptyMsgPersist {
  m: EmptyMsg;
  init() {
    self.m = EmptyMsg{};
  }
}