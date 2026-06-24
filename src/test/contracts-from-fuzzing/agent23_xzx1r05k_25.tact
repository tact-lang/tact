message Data {
  x: Int;
}

contract Test {
  receive(msg: Data) {
    msg.x = msg.x + 1;
  }
}