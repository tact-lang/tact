message Data {
  s: Int;
}

contract Test {
  receive(data: Data) {
    let n = data.s + 1;
  }
}