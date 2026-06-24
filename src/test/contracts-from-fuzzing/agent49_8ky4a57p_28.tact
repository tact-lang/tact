message M {}

contract Test {
  receive(msg: M) {
    let a: Int = 0;
  }
}