struct Optionals {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract TestOpts {
  field: Optionals;

  init() {
    self.field = Optionals{
      a: null,
      b: false,
      c: null
    };
  }
}
