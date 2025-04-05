message SingleFieldMessage {
  intField: Int
}

contract Test {
  receive() {
    let a: SingleFieldMessage = SingleFieldMessage{intField: 5};
  }
}