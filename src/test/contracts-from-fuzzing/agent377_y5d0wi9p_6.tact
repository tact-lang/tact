struct LargeStruct {
  f1: Int;
  f2: Int?;
  f3: Bool;
  f4: Bool?;
  f5: String;
  f6: String?;
  f7: Cell?;
  f8: Cell?;
  f9: Slice?;
  f10: Slice?;
  f11: Address?;
  f12: Address?;
}

contract ManyTypes {
  state: LargeStruct = LargeStruct{
    f1: 1, f2: null, f3: true, f4: null, f5: "hi", f6: null, f7: null, f8: null, f9: null, f10: null, f11: null, f12: null
  };
}