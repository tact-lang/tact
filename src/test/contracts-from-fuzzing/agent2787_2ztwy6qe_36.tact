struct Mega {
  f1: Int; f2: Int?; f3: Bool; f4: Bool?; f5: String?; 
  f6: String; f7: Int; f8: Int?; f9: Bool; f10: Bool?;
  f11: String?; f12: String; f13: Int; f14: Int?; f15: Bool;
  f16: Bool?; f17: String?; f18: String; f19: Int; f20: Int?;
  f21: Bool; f22: Bool?; f23: String?; f24: String; f25: Int; 
  f26: Int?; f27: Bool; f28: Bool?; f29: String?; f30: String;
}

contract BigBag {
  stuff: Mega;

  init() {
    self.stuff = Mega{
      f1:1,f2:null,f3:true,f4:false,f5:null,
      f6:"hi",f7:2,f8:3,f9:false,f10:null,
      f11:null,f12:"ok",f13:4,f14:null,f15:true,
      f16:null,f17:"zz",f18:"lo",f19:5,f20:null,
      f21:true,f22:null,f23:null,f24:"ho",f25:6,
      f26:7,f27:true,f28:false,f29:null,f30:"done"
    };
  }
}
