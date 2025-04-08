struct S1 {
  x: Int;
}

struct S2 {
  y: Int;
}

struct Combo {
  a: S1;
  b: S2;
  c: Int;
}

contract TestContract {
  combined: Combo;

  init() {
    self.combined = Combo{ a: S1{ x:1 }, b: S2{ y:2 }, c:3 };
  }
}