struct S1 { x: Int }
struct S2 { y: Int }

contract Cross {
  a: S1;
  b: S2;

  init() {
    self.a = S1{ x:10 };
    self.b = S2{ y:20 };
  }
}
