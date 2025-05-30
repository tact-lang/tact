message BoolMsg {
  flag: Bool;
}

contract Test {
  receive(m: BoolMsg) {
    if (m.flag) {
    }
  }
}