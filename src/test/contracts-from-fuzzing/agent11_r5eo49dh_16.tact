struct S {
  s: Slice?;
}

contract Test {
  receive() {
    let s = S{s: null};
  }
}