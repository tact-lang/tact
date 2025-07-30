message Data {
  a: Int;
}

contract Test {
  receive(msg: Data) {
    msg.a = 7;
  }
}