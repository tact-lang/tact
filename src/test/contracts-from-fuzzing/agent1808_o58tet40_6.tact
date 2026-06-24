struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: String?;
  e: Cell?;
}

contract OptionalFieldsTest {
  many: ManyOptionals;

  init() {
    self.many = ManyOptionals{
      a: null,
      b: true,
      c: null,
      d: "hello",
      e: null
    };
  }
}