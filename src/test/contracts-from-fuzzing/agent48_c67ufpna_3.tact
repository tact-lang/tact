message M {
  a: Int;
}

contract Test {
  receive() {
    let m = M{ a: 1 };
  }
}