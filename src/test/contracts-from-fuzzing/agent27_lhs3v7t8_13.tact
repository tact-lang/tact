struct Wrap {
  opt_value: Int?;
}

contract Test {
  receive() {
    let d: Wrap = Wrap{opt_value: null};
  }
}