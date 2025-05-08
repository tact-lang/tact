message M {
  n: Int;
}

contract Test {
  receive(msg: M) {
    msg.n = 5;
  }
}