struct A { x: Int; }
struct B { y: Int; }

contract CrossFields {
  a: A;
  b: B;
  a_opt: A?;
  b_opt: B?;

  init() {
    self.a = A{x:1};
    self.b = B{y:2};
    self.a_opt = null;
    self.b_opt = null;
  }
}