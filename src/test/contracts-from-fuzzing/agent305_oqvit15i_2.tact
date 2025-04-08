struct LargeStruct {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Slice;
  f5: Int;
  f6: Bool;
  f7: String;
  f8: Cell;
  f9: Int;
  f10: Bool;
}

contract LargeFieldsTest {
  big: LargeStruct;

  init() {
    self.big = LargeStruct{
      f1: 1, f2: true, f3: "s",
      f4: emptyCell().asSlice(), f5: 5,
      f6: false, f7: "t", f8: emptyCell(),
      f9: -9, f10: true,
    };
  }
}