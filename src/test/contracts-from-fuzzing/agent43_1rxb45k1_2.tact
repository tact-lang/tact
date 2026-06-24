struct S {
  x: Int
}

contract Test {
  receive() {
    let s = S{x: 5};
  }
}