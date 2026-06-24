struct LargeStruct {
  f01: Int;
  f02: Bool;
  f03: Int;
  f04: Bool;
  f05: String;
  f06: Bool?;
  f07: Int?;
  f08: String?;
  f09: Int;
  f10: Bool;
  f11: Int;
  f12: Bool;
  f13: String;
  f14: Bool?;
  f15: Int?;
  f16: String?;
}

contract LargeFields {
  field: LargeStruct;
  init() {
    self.field = LargeStruct{
      f01:1, f02:true, f03:2, f04:false, f05:"x", f06:null, f07:null, f08:null,
      f09:3, f10:true, f11:4, f12:false, f13:"y", f14:null, f15:null, f16:null
    };
  }
}