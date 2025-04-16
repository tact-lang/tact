struct D1 { f1: Int }
struct D2 { f2: D1 }
struct D3 { f3: D2 }
struct D4 { f4: D3 }
struct D5 { f5: D4 }

contract Test {
  nested: D5;
  init() {
    self.nested = D5{ f5: D4{ f4: D3{ f3: D2{ f2: D1{ f1: 99 }}}}};
  }
}
