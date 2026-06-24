struct NestedOpt {
  a: Int?;
  b: String?;
  c: Address?;
  d: Cell?;
  e: Slice?;
}

contract OptionalStruct {
  s: NestedOpt;

  init() {
    self.s = NestedOpt{
      a: null,
      b: "hello",
      c: null,
      d: null,
      e: null,
    };
  }
}