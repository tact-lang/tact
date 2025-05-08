message M {
  x: Int = 5;
}

contract Test {
  receive(msg: M) {
    let val = msg.x;
  }
}