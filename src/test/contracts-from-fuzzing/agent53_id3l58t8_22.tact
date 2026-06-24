message FlagMsg {
  flag: Bool = true;
}

contract Test {
  receive(msg: FlagMsg) {
    let b = msg.flag;
  }
}