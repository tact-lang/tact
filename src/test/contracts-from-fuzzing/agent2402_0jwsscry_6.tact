struct BigStruct {
  f1: Int;
  f2: Bool;
  f3: Address;
  f4: Cell;
  f5: Builder;
  f6: Slice;
  f7: String;
  f8: Int;
  f9: Bool;
  f10: Address;
  f11: Cell;
  f12: Builder;
  f13: Slice;
  f14: String;
  f15: Int;
  f16: Bool;
}

contract BigStructContract {
  data: BigStruct;

  init() {
    self.data = BigStruct{
      f1: 1,
      f2: true,
      f3: myAddress(),
      f4: emptyCell(),
      f5: beginCell(),
      f6: emptyCell().asSlice(),
      f7: "a",
      f8: 8,
      f9: false,
      f10: myAddress(),
      f11: emptyCell(),
      f12: beginCell(),
      f13: emptyCell().asSlice(),
      f14: "b",
      f15: 15,
      f16: true,
    };
  }
}