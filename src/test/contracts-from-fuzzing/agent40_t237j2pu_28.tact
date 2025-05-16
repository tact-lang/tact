message EmptyMessage {
}

contract Test {
  receive(msg: EmptyMessage) {
    let e = EmptyMessage { };
  }
}