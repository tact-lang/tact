message NumberWrapper {
  a: Int;
}

contract TestContract {
  receive(msg: NumberWrapper) {
    let x: Int = msg.a;
  }
}