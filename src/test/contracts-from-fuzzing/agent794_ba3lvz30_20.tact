struct LotsOfOpts {
  f1: Int?; f2: Int?; f3: Int?; f4: Int?; f5: Int?;
  f6: Int?; f7: Int?; f8: Int?; f9: Int?; f10: Int?;
  f11: Int?; f12: Int?; f13: Int?; f14: Int?; f15: Int?;
  f16: Int?; f17: Int?; f18: Int?; f19: Int?; f20: Int?;
  f21: Int?; f22: Int?; f23: Int?; f24: Int?; f25: Int?;
  f26: Int?; f27: Int?; f28: Int?; f29: Int?; f30: Int?;
}

contract ManyOptionalFields {
  data: LotsOfOpts;

  init() {
    self.data = LotsOfOpts{
      f1:null,f2:null,f3:null,f4:null,f5:null,
      f6:null,f7:null,f8:null,f9:null,f10:null,
      f11:null,f12:null,f13:null,f14:null,f15:null,
      f16:null,f17:null,f18:null,f19:null,f20:null,
      f21:null,f22:null,f23:null,f24:null,f25:null,
      f26:null,f27:null,f28:null,f29:null,f30:null
    };
  }
}
