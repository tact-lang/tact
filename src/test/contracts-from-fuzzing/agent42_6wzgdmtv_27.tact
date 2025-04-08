struct ManyOpts {
  f1: Int?; f2: Int?; f3: Int?; f4: Int?; f5: Int?;
  f6: String?; f7: String?; f8: String?; f9: String?; f10: String?;
  f11: Bool?; f12: Bool?; f13: Bool?; f14: Bool?; f15: Bool?;
}

contract TestContract {
  store: ManyOpts;

  init() {
    self.store = ManyOpts{
      f1:null,f2:null,f3:null,f4:null,f5:null,
      f6:null,f7:null,f8:null,f9:null,f10:null,
      f11:null,f12:null,f13:null,f14:null,f15:null
    };
  }
}