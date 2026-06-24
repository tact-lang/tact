struct OptionalNested {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract TestContract {
  optData: OptionalNested;

  init() {
    self.optData = OptionalNested{
      a: null,
      b: true,
      c: null
    };
  }
}