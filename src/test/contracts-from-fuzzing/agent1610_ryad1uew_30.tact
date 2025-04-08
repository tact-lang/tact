struct S1 { x: Int }
struct S2 { y: Int }

contract MultiStructs {
  a: S1;
  b: S2;

  init() {
    self.a = S1{x:1};
    self.b = S2{y:2};
  }
}