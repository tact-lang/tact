struct S {
  a: Int;
}

struct Outer {
  s: S;
}

contract Test {
  receive() {
    let x = Outer{ s: S{ a: 10 } };
  }
}