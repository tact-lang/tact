struct Deep3 { x: Int }
struct Deep2 { inner: Deep3 }
struct Deep1 { inner: Deep2 }

contract Test {
  field: Deep1;

  init() {
    self.field = Deep1{ inner: Deep2{ inner: Deep3{ x: 9 } } };
  }
}