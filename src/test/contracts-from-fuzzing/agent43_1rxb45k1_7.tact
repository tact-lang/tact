struct S { x: Int }

contract Test {
  receive() {
    let s1 = S{x: 1};
    let s2 = s1;
    s2.x = 10;
  }
}