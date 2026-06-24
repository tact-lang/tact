struct LongOptional {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Bool?;
  e: Bool?;
  f: String?;
  g: String?;
}

contract LongOptTest {
  value: LongOptional;
  init() {
    self.value = LongOptional{
      a: null, b: null, c: null, d: null, e: null, f: null, g: null
    };
  }
}