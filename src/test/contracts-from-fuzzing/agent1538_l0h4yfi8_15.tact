struct S1 { a: Int; }
struct S2 { b: Int; }
struct Combined {
  s1: S1;
  s2: S2;
  x: Int;
}

contract Test {
  combined: Combined;

  init() {
    self.combined = Combined{
      s1: S1{a:1},
      s2: S2{b:2},
      x: 10
    };
  }
}