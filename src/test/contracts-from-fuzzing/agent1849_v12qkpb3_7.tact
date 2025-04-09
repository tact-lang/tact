struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Cell?;
  e: Builder?;
  f: Slice?;
  g: Address?;
}

contract ManyOptionalFieldsTest {
  d: ManyOptionals;

  init() {
    self.d = ManyOptionals{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
      f: null,
      g: null
    };
  }
}