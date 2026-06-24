struct S {
  f: Int;
}

contract Test {
  receive() {
    let x: S = S{ f: 10 };
    let y = x.f;
  }
}