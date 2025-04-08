struct S1 { a: Int?; b: Int }
struct S2 { c: S1; d: Int? }

contract TestContract {
  field: S2;

  init() {
    self.field = S2 {
      c: S1 { a: null, b: 10 },
      d: 20
    };
  }
}