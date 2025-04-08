struct A { a: Int } 
struct B { b: A }

contract TestContract {
  x: A?;
  y: B;

  init() {
    self.x = null;
    self.y = B { b: A { a: 123 } };
  }
}