message DefaultMessage {
  text: String = "hello";
  number: Int = 10;
}

contract Test {
  receive() {
    let m = DefaultMessage{};
  }
}