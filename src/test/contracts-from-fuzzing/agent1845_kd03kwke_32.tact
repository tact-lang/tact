// Struct with different primitives, optional String
struct StringMix {
  s1: String?;
  s2: String;
  b1: Bool;
  i1: Int;
}
contract OptionalStringTest {
  m: StringMix;
  init() {
    self.m = StringMix{
      s1: null,
      s2: "hello",
      b1: true,
      i1: 123
    };
  }
}
