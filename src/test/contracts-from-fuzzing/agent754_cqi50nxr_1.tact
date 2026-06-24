struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Cell?;
  f: Slice?;
}

contract TestOpt {
  optStruct: ManyOptionals = ManyOptionals{
    a: null,
    b: null,
    c: null,
    d: null,
    e: null,
    f: null,
  };

  init() {
    self.optStruct = ManyOptionals{
      a: 1,
      b: true,
      c: "abc",
      d: myAddress(),
      e: emptyCell(),
      f: emptyCell().asSlice(),
    };
  }
}
