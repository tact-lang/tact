message M {
  x: Int;
}

contract Test {
  receive(msg: M) {
    let a: Int = msg.x;
  }
}