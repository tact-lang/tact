struct S {
  c: Cell?;
}

contract Test {
  receive() {
    let s = S{c: null};
  }
}