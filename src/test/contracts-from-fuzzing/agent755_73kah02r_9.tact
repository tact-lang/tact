struct OptsOnly {
  a: Int?;
  b: String?;
  c: Bool?;
  e: Cell?;
  f: Address?;
}

contract Test7 {
  o: OptsOnly;

  init() {
    self.o = OptsOnly{
      a: null,
      b: null,
      c: null,
      e: null,
      f: null,
    };
  }
}
