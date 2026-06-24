// Nested optional struct with mixed optional/non-optional fields
struct Sub {
  a: Int;
  b: Int?;
  c: String?;
}

contract TestContract {
  s: Sub;

  init() {
    self.s = Sub{a: 5, b: null, c: null};
  }
}