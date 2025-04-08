struct OptionalsNested {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Cell?;
  e: Slice?;
  f: Builder?;
  g: Address?;
}

contract NestedOptionals {
  data: OptionalsNested;

  init() {
    self.data = OptionalsNested{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
      f: null,
      g: null,
    };
  }
}