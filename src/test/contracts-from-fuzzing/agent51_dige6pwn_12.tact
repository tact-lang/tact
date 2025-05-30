struct A { x: Int; }
struct B { a: A; }
contract Test { data: B;
  init() {
    self.data = B { a: A { x: 42 } };
  }
}