struct S1 { a: Int; b: Int?; }
struct S2 { x: S1; y: Int; }

contract NoDefaults {
  data: S2;

  init() {
    self.data = S2{
      x: S1{ a: 7, b: null },
      y: 42
    };
  }
}
