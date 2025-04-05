struct S {
  s: Slice?;
}

contract Test {
  receive() {
    let s = S{s: null};
    let s2 = S{s: s.s};
  }
}