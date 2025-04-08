// Contract with multiple nested structs with multi-type optionals
struct X1 {
  a: Int?;
  b: Bool?;
}

struct X2 {
  x1: X1?;
  c: String?;
}

struct X3 {
  x2: X2?;
  d: Int?;
}

contract MultiNestedComplex {
  storage: X3?;

  init() {
    self.storage = X3{
      x2: null,
      d: null,
    };
  }
}