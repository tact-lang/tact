struct MixedOpts {
  a: Int;
  b: Bool?;
  c: Address;
  d: Cell?;
  e: Slice;
  f: String?;
}

contract MixedOptionals {
  data: MixedOpts;

  init() {
    self.data = MixedOpts{
      a: 1,
      b: null,
      c: myAddress(),
      d: null,
      e: emptyCell().asSlice(),
      f: "hello",
    };
  }
}
