struct LargeNested {
  f1: Int; f2: Int; f3: Int; f4: Int; f5: Int;
  f6: Int; f7: Int; f8: Int; f9: Int; f10: Int;
  f11: Int; f12: Int; f13: Int; f14: Int; f15: Int;
  f16: Int; f17: Int; f18: Int; f19: Int; f20: Int;
}

contract LargeTest {
  big: LargeNested = LargeNested{
    f1:0,f2:0,f3:0,f4:0,f5:0,f6:0,f7:0,f8:0,f9:0,f10:0,
    f11:0,f12:0,f13:0,f14:0,f15:0,f16:0,f17:0,f18:0,f19:0,f20:0
  };

  init() {
    self.big = LargeNested{
      f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,f9:9,f10:10,
      f11:11,f12:12,f13:13,f14:14,f15:15,f16:16,f17:17,f18:18,f19:19,f20:20
    };
  }
}
