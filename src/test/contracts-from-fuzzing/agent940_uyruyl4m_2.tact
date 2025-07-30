struct ManyOptionals {
  a: Int?;
  b: Int?;
  c: Bool?;
  d: String?;
  e: Address?;
}

contract OptionalFieldsTest {
  val: ManyOptionals;

  init() {
    self.val = ManyOptionals{
      a: 1,
      b: null,
      c: true,
      d: null,
      e: null
    };
  }
}