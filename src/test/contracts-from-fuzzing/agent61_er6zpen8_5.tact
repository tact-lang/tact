message EmptyMessage {}

contract Test {
  receive(message: EmptyMessage) {
    // Do nothing
  }
}