struct Special {
  counter: Int as uint32;
  flag: Bool;
}

contract TestContract {
  state: Special;
  init() {
    self.state = Special{ counter: 17, flag: true };
  }
}