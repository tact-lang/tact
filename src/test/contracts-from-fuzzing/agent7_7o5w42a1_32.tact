struct NoSemiColonField {
  val: Int
}

contract Test {
  receive() {
    let m = NoSemiColonField { val: 5 };
  }
}