message Data {
  a: Int;
  b: Int;
}

contract Test {
  receive(msg: Data) {
    msg.a = msg.b;
    msg.b = msg.a;
  }
}