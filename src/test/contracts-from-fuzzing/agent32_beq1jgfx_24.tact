message TestMessage {}

contract Test {
  receive() {
    let m = TestMessage{};
  }
}