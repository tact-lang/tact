struct A { i: Int; }
struct B { a1: A; a2: A; }

contract TestContract {
  data: B;

  init() {
    self.data = B{
      a1: A{i:1},
      a2: A{i:2}
    };
  }
}