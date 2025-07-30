struct Wide {
  f1: Int;
  f2: String;
  f3: Bool;
  f4: Int;
  f5: String;
  f6: Bool;
  f7: Int;
  f8: String;
  f9: Bool;
  f10: Int;
  f11: String;
  f12: Bool;
  f13: Int;
  f14: String;
  f15: Bool;
  f16: Int;
  f17: String;
  f18: Bool;
  f19: Int;
  f20: String;
}

contract Test4 {
  wide: Wide;

  init() {
    self.wide = Wide{
      f1:1, f2:"", f3:true, f4:2, f5:"", f6:false,
      f7:3, f8:"", f9:true, f10:4, f11:"", f12:false,
      f13:5, f14:"", f15:true, f16:6, f17:"", f18:false,
      f19:7, f20:""
    };
  }
}