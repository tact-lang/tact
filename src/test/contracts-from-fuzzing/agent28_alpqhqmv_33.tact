message NullOptionalInt {
  val: Int?
}

contract Test {
  receive() {
    let m: NullOptionalInt = NullOptionalInt{val: null};
  }
}