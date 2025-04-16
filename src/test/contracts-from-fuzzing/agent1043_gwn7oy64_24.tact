message EmptyMsg {}

struct Holder {
  m: EmptyMsg;
}

contract TestContract {
  holder: Holder;
  init() {
    self.holder = Holder{ m: EmptyMsg{} };
  }
}