struct S {
  opt: Int?
}

contract Test {
  receive() {
    let x: S = S{opt: null};
  }
}