message Data {
  x: Int;
}

contract Test {
  receive(msg: Data) {
    let y = msg.x;
    y = 5;
  }
}