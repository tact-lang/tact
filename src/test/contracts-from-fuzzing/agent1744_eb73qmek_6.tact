// test a struct with many nested optional primitive fields
struct OptionalPrimitives {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Cell?;
  f: Builder?;
  g: Slice?;
}

contract OptionalPrimitivesStorage {
  data: OptionalPrimitives;

  init() {
    self.data = OptionalPrimitives{
      a: null, b: null, c: null, d: null, e: null, f: null, g: null
    };
  }
}
