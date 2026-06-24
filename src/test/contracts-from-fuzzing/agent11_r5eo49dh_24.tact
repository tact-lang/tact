message WrappedIntOpt {
  x: Int?;
}

contract Test {
  receive(message: WrappedIntOpt) {
    let copy = WrappedIntOpt{x: message.x};
  }
}