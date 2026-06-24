struct A1 { x: Int }
struct A2 { a1: A1 }
struct A3 { a2: A2 }
struct A4 { a3: A3 }

contract DeepNested4 {
  s: A4;

  init() {
    self.s = A4{ a3: A3{ a2: A2{ a1: A1{ x: 77 } } } };
  }
}