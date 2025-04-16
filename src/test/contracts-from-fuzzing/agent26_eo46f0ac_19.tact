struct NegativeDefault {
  value: Int = -5;
}

contract Test {
  receive() {
    let d = NegativeDefault{};
  }
}