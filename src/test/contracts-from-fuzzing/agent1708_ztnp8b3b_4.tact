struct LargeStruct {
  f1: Int;
  f2: Int?;
  f3: Bool;
  f4: Bool?;
  f5: String;
  f6: String?;
  f7: Address;
  f8: Address?;
  f9: Cell;
  f10: Cell?;
  f11: Slice;
  f12: Slice?;
  f13: Int;
  f14: Int?;
  f15: Bool;
  f16: Bool?;
  f17: String;
  f18: String?;
  f19: Address;
  f20: Address?;
  f21: Cell;
  f22: Cell?;
  f23: Slice;
  f24: Slice?;
}

contract TestContract {
  bigField: LargeStruct;

  init() {
    self.bigField = LargeStruct{
      f1: 1, f2: null, f3: false, f4: null,
      f5: "", f6: null, f7: myAddress(), f8: null,
      f9: emptyCell(), f10: null, f11: emptyCell().asSlice(), f12: null,
      f13: 0, f14: null, f15: false, f16: null,
      f17: "", f18: null, f19: myAddress(), f20: null,
      f21: emptyCell(), f22: null, f23: emptyCell().asSlice(), f24: null
    };
  }
}
