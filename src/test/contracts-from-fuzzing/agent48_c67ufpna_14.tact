struct S {
  b: Int;
}

contract Test {
  receive() {
    let a = S{ b: 1 };
    let b: S = a;
  }
}