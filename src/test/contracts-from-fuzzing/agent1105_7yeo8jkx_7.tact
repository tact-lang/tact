struct BigStruct {
  f01: Int; f02: Int?; f03: Bool; f04: Bool?; f05: String;
  f06: String?; f07: Address; f08: Address?; f09: Cell; f10: Cell?;
  f11: Int; f12: Int?; f13: Bool; f14: Bool?; f15: String;
  f16: String?; f17: Address; f18: Address?; f19: Cell; f20: Cell?;
}

contract TwentyFields {
  big: BigStruct;
  init() {
    self.big = BigStruct{
      f01:1, f02:null, f03:false, f04:true, f05:"a",
      f06:null, f07:myAddress(), f08:null, f09:emptyCell(), f10:null,
      f11:2, f12:null, f13:true, f14:null, f15:"b",
      f16:null, f17:myAddress(), f18:null, f19:emptyCell(), f20:null
    };
  }
}