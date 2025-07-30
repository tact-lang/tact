struct LongStruct {
  f1: Int;
  f2: Int;
  f3: Address;
  f4: Cell;
  f5: Slice;
  f6: String;
  f7: Int?;
  f8: Bool?;
  f9: Address?;
  f10: Cell?;
  f11: Slice?;
  f12: String?;
}

contract LongFields {
  s: LongStruct;

  init() {
    self.s = LongStruct{
      f1: 1,
      f2: 2,
      f3: myAddress(),
      f4: emptyCell(),
      f5: emptyCell().asSlice(),
      f6: "hello",
      f7: null,
      f8: false,
      f9: null,
      f10: null,
      f11: null,
      f12: null,
    };
  }
}