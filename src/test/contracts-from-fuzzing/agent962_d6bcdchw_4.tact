struct Big {
  f1: Int;
  f2: Bool;
  f3: Int?;
  f4: Bool?;
  f5: String;
  f6: Cell;
  f7: Slice;
  f8: Address;
  f9: String?;
  f10: Address?;
}

contract TestBig {
  data: Big;

  init() {
    self.data = Big{
      f1: 1,
      f2: true,
      f3: null,
      f4: null,
      f5: "hello",
      f6: emptyCell(),
      f7: emptyCell().asSlice(),
      f8: myAddress(),
      f9: null,
      f10: null
    };
  }
}