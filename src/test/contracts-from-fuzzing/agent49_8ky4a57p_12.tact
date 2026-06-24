message M {
  a: Int;
  b: Int = 2;
  c: Int;
}

contract Test {
  receive() {
    let a: Int = 0;
  }
}