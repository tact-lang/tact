struct StructWithOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptionalStructFieldTest {
  field: StructWithOptionals;

  init() {
    self.field = StructWithOptionals{
      a: null,
      b: true,
      c: "hello",
    };
  }
}
