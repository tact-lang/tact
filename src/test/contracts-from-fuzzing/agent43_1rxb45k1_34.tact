struct S { x: Int; }

contract Test {
  receive() {
    let s = S{x: 1};
    s = S{x: 2};
  }
}