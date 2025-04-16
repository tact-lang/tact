struct NegativeDefault {
  a: Int = -42;
}

contract Test {
  receive() {
    NegativeDefault{};
  }
}