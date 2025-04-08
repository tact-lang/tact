struct LargeFlat {
// 30 fields, Int and Bool alternating
  f01: Int;
  f02: Bool;
  f03: Int;
  f04: Bool;
  f05: Int;
  f06: Bool;
  f07: Int;
  f08: Bool;
  f09: Int;
  f10: Bool;
  f11: Int;
  f12: Bool;
  f13: Int;
  f14: Bool;
  f15: Int;
  f16: Bool;
  f17: Int;
  f18: Bool;
  f19: Int;
  f20: Bool;
  f21: Int;
  f22: Bool;
  f23: Int;
  f24: Bool;
  f25: Int;
  f26: Bool;
  f27: Int;
  f28: Bool;
  f29: Int;
  f30: Bool;
}

contract TestContract {
  big: LargeFlat;

  init() {
    self.big = LargeFlat{
      f01:1, f02:true, f03:2, f04:false, f05:3, f06:true,
      f07:4, f08:false, f09:5, f10:true, f11:6, f12:false,
      f13:7, f14:true, f15:8, f16:false, f17:9, f18:true,
      f19:10, f20:false, f21:11, f22:true, f23:12, f24:false,
      f25:13, f26:true, f27:14, f28:false, f29:15, f30:true
    };
  }
}