message WrappedInt {
  value: Int;
}

contract Test {
  receive(msg: WrappedInt) {
    let v = msg.value;
  }
}