struct OptIntBool {
  i: Int?;
  b: Bool?;
}

contract FieldNullable {
  f: OptIntBool;

  init() {
    self.f = OptIntBool{
      i: null,
      b: null
    };
  }
}