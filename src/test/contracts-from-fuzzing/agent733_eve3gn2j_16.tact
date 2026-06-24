struct Child {
  x: Int = 7;
  y: Bool = true;
}

struct Parent {
  a: Int = 1;
  b: Child = Child{};
  c: Bool = false;
}

contract TestContract {
  myfield: Parent;

  init() {
    self.myfield = Parent{
      a: 42,
      b: Child{ x: 99, y: false },
      c: true
    };
  }
}