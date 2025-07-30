struct Inner {
  a: Int;
  b: String;
  c: Bool?;
  d: Slice?;
  e: Address?;
}

contract Test {
  innerField: Inner;

  init() {
    self.innerField = Inner{
      a: 42,
      b: "xyz",
      c: null,
      d: null,
      e: null,
    };
  }
}