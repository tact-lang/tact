struct OptionalInner {
  value: Int?
}

contract Test {
  receive() {
    let o: OptionalInner = OptionalInner{value: null};
  }
}