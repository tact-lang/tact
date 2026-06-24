message Data {
  f: Int?;
}

contract Test {
  receive(message: Data) {
    return;
  }
}