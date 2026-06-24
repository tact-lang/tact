struct B1 { x: Int }
struct B2 { y: Int }
struct B3 { z: Int }

contract Test19 {
  a: B1;
  b: B2;
  c: B3;
  init() {
    self.a = B1{ x: 10 };
    self.b = B2{ y: 20 };
    self.c = B3{ z: 30 };
  }
}
