message M {
  a: Int;
}

contract Test {
  receive() {
    let y = M{a: 3};
  }
}