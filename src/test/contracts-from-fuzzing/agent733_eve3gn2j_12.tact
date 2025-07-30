struct MixOpt {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: Cell?;
  e: Slice?;
  f: String?;
}

contract TestContract {
  m: MixOpt;
  init() {
    self.m = MixOpt{
      a: 5,
      b: null,
      c: null,
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: "hi"
    };
  }
}