struct S1 {
  f: Int;
}

struct S2 {
  s: S1;
}

contract Test {
  receive() {
    let i = 12;
  }
}