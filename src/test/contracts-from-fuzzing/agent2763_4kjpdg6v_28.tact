struct A { x: Int }
struct B { y: Int }

contract VertConcat {
  f1: A;
  f2: B;

  init() {
    self.f1 = A{x:1};
    self.f2 = B{y:2};
  }
}