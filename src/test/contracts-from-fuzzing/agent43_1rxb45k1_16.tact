struct S { x: Int }

contract Test {
  receive() {
    let a = S{x: 1};
    let b = S{x: 2};
    a = b;
  }
}