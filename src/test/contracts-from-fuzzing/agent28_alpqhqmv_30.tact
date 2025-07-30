message BooleanMessage {
  flag: Bool
}

contract Test {
  receive() {
    let m: BooleanMessage = BooleanMessage{flag: false};
  }
}