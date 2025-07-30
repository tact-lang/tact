// Very deeply nested structure with mix of optionals
struct D4 { val: Int; }
struct D3 { d4: D4?; }
struct D2 { d3: D3; }
struct D1 { d2: D2; }

contract Test {
  nested: D1;

  init() {
    self.nested = D1{ d2: D2{ d3: D3{ d4: D4{ val: 571 } } } };
  }
}