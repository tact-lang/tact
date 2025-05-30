struct Negative {
  id: Int;
}

contract Test {
  receive() {
    let n = Negative{ id: -1 };
  }
}