message M {
  f: Int;
}

contract Test {
  receive() {
    let a = M{f:1};
    let b = a.f;
  }
}