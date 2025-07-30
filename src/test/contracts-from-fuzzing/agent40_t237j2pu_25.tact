struct S {
  opt: Int?;
}

contract Test {
  receive() {
    let s = S { opt: null };
  }
}