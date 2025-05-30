struct WrappedInt {
  value: Int
}

contract Test {
  receive() {
    let wi: WrappedInt = WrappedInt{value: 10};
  }
}