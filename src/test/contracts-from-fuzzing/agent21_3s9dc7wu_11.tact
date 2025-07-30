message MyMessage { a: Int; b: Int }

contract Test {
  receive(m: MyMessage) {
    // no-op
  }
}