message Data {
  x: Int;
}

contract Test {
  receive(msg: Data) {
    let y = msg;
    y.x = 10;
  }
}