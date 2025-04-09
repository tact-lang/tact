struct ManyOpt {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Slice?;
  e: Cell?;
  f: Int?;
}

contract OptionalFieldsTest {
  opt: ManyOpt;

  init() {
    self.opt = ManyOpt{
      a: null, b: true, c: null,
      d: emptyCell().asSlice(), e: null, f: 42,
    };
  }
}