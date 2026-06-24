message M {}

contract Test {
  receive(msg: M) {
    let a: Int = 0;
  }
  receive() {
    let b: Int = 1;
  }
}