struct OptionalMany {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int?;
  e: Int?;
  f: Int?;
  g: Int?;
}

contract OptionalManyFields {
  val: OptionalMany;

  init() {
    self.val = OptionalMany{
      a: 1, b: 2, c: null, d: 4, e: null, f: 6, g: null
    };
  }
}