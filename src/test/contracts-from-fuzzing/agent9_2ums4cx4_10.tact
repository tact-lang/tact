struct OptionalDeep {
  a: Int?;
  b: SubOpt?;
}

struct SubOpt {
  x: Int?;
  y: String?;
}

contract OptDeepTest {
  field: OptionalDeep;

  init() {
    self.field = OptionalDeep{
      a: null,
      b: null,
    };
  }
}
