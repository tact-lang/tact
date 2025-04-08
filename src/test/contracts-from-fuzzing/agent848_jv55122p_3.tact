struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Cell?;
  e: Address?;
}

contract OptionalFieldsTest {
  opt: ManyOptionals;

  init() {
    self.opt = ManyOptionals{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
    };
  }
}