struct LongStruct {
  f1: Int;
  f2: Int;
  f3: Bool;
  f4: String;
  f5: Bool?;
  f6: String?;
  f7: Int?;
  f8: Int;
  f9: Bool;
  f10: String;
  f11: Int;
  f12: Bool?;
  f13: String?;
  f14: Int;
  f15: String;
}

contract TestStorage {
  longData: LongStruct;

  init() {
    self.longData = LongStruct{
      f1: 1, f2: 2, f3: true, f4: "hi", f5: null, f6: null, f7: 77, f8: 8,
      f9: false, f10: "ok", f11: 11, f12: true, f13: "foo", f14: 14, f15: "bar"
    };
  }
}