message OptionalMessage {
  value: Int?
}

contract Test {
  receive() {
    let m: OptionalMessage = OptionalMessage{value: null};
  }
}