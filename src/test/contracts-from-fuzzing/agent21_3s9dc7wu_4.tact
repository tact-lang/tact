message InnerMessage { a: Int }
message OuterMessage { inner: InnerMessage }

contract Test {
  receive() {
    // no-op
  }
}