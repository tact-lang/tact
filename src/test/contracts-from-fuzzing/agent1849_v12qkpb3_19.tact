struct A1 { f1: Int; }
struct A2 { a1: A1; }
struct A3 { a2: A2; }
struct A4 { a3: A3; }
struct A5 { a4: A4; }

contract DeepFiveLevels {
  nested: A5;

  init() {
    self.nested = A5{ a4: A4{ a3: A3{ a2: A2{ a1: A1{ f1: 123 } } } } };
  }
}