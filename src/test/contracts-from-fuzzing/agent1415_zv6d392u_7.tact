struct NestedOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
}

struct OptDeep {
  f1: Int?;
  f2: NestedOptionals?;
}

contract TestContract {
  optdeep: OptDeep;

  init() {
    self.optdeep = OptDeep{
      f1: null,
      f2: null,
    };
  }
}