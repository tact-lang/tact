message(1) EmptyMsg {}

contract MsgInStorage {
  last: EmptyMsg;

  init() {
    self.last = EmptyMsg{};
  }
}