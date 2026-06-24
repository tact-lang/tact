struct BigStruct {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Int as uint8;
  f5: Int?;
  f6: Bool?;
  f7: String?;
  f8: Int as int32;
  f9: String;
  f10: Bool;
  f11: Int as uint64;
  f12: Bool?;
  f13: Int? as uint8;
  f14: String;
  f15: Int;
  f16: Bool;
  f17: Int as uint16;
  f18: String?;
  f19: Bool;
  f20: Int as int128;
}

contract LargeVariety {
  big: BigStruct;

  init() {
    self.big = BigStruct {
      f1: 1, f2: true, f3: "a", f4: 4, f5: null, f6: null, f7: null, f8: -12345,
      f9: "b", f10: false, f11: 100000, f12: null, f13: null, f14: "c",
      f15: 15, f16: true, f17: 1729, f18: null, f19: false, f20: -1000000
    };
  }
}