struct OptionalStruct {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Int?;
  e: Bool?;
}

contract TestContract {
  optStruct: OptionalStruct?;

  init() {
    self.optStruct = OptionalStruct {
      a: null,
      b: true,
      c: null,
      d: 42,
      e: null
    };
  }
}