struct ManyFieldsOpt {
  i1: Int;
  i2: Int;
  i3: Int;
  s1: String;
  s2: String;
  b1: Bool;
  b2: Bool;
  addr1: Address?;
  addr2: Address?;
  sl1: Slice;
  sl2: Slice;
  c1: Cell;
  c2: Cell;
}

contract Test4 {
  many: ManyFieldsOpt;

  init() {
    self.many = ManyFieldsOpt{
      i1: 1,
      i2: 2,
      i3: 3,
      s1: "a",
      s2: "b",
      b1: true,
      b2: false,
      addr1: null,
      addr2: null,
      sl1: emptyCell().asSlice(),
      sl2: emptyCell().asSlice(),
      c1: emptyCell(),
      c2: emptyCell(),
    };
  }
}
