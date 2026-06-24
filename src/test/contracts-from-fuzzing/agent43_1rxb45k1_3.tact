message M {
  x: Int
}

contract Test {
  receive(msg: M) {
    // test message reception
  }
}