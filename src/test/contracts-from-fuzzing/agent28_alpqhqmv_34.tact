message DefaultZeroInt {
  val: Int
}

contract Test {
  receive() {
    let m: DefaultZeroInt = DefaultZeroInt{val: 0};
  }
}