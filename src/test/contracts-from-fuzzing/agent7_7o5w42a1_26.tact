message WithBool {
  b: Bool;
}

contract Test {
  receive() {
    let w = WithBool { b: true };
  }
}