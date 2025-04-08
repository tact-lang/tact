struct A1 { n: Int; }
struct A2 { a1: A1; }
struct A3 { a2: A2; }
struct A4 { a3: A3; }

contract Deep {
  field: A4;

  init() {
    self.field = A4{ a3: A3{ a2: A2{ a1: A1{ n: 5 } } } };
  }
}