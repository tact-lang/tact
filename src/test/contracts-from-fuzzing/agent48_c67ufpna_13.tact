message M {
  a: Int;
}

contract Test {
  receive() {
    let m1 = M{ a: 1 };
    let m2: M = m1;
  }
}