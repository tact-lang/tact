message M {
  x: Int
}

contract Test {
  receive() {
    let m = M{x: 10};
  }
}