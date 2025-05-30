message M1 {}
message M2 {}

contract Test {
  receive(msg: M1) {
    let a: Int = 0;
  }
  receive(msg: M2) {
    let b: Int = 1;
  }
}