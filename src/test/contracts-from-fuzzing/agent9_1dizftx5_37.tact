message M {
  a: Int;
  b: Bool;
}

contract Test {
  receive(msg: M) {
    msg.a = 10;
  }
}