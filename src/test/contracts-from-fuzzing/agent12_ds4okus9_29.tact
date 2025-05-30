struct Numbers {
  a: Int;
  b: Bool;
}

contract Test {
  receive() {
    let n = Numbers{a: 1, b: false};
  }
}