message HasBool {
  flag: Bool;
}

contract Test {
  receive(msg: HasBool) {
    if (msg.flag) {
      throw(1);
    }
  }
}