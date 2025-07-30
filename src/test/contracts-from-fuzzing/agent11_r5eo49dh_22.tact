message Example {
  f: Int;
}

contract Test {
  receive(message: Example) {
    let msg = message;
    let copy = Example{f: msg.f};
  }
}