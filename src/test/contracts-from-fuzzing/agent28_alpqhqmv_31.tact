message NegativeInt {
  val: Int
}

contract Test {
  receive() {
    let m: NegativeInt = NegativeInt{val: -123};
  }
}