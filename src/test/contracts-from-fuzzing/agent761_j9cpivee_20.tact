struct In1 { a: Int }
struct In2 { a: In1 }
struct In3 { a: In2 }
struct In4 { a: In3 }
struct In5 { a: In4 }
struct In6 { a: In5 }
struct In7 { a: In6 }

contract Nest7 {
  data: In7;
  init() {
    self.data = In7{ a: In6{ a: In5{ a: In4{ a: In3{ a: In2{ a: In1{ a: 5 } } } } } } };
  }
}