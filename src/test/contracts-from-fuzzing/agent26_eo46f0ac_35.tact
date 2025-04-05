message BoolDefault {
  flag: Bool = false;
}

contract Test {
  receive() {
    let b = BoolDefault{};
  }
}