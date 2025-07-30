message M1 {}
message M2 {}

contract Test {
  receive(msg: M1) {
  }

  receive(msg: M2) {
  }
}