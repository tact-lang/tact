struct DeepOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Cell?;
  e: Slice?;
  f: Address?;
}

contract DeepOptionalsStorage {
  nested: DeepOptionals;

  init() {
    self.nested = DeepOptionals{
      a: 1,
      b: null,
      c: "test",
      d: null,
      e: null,
      f: null
    };
  }
}