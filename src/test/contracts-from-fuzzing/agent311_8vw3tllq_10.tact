struct OptionalsWide {
  x1: Int?;
  x2: String?;
  x3: Bool?;
  x4: Int?;
  x5: Bool?;
  x6: String?;
  x7: Int?;
  x8: Bool?;
  x9: String?;
}

contract WideOpt {
  data: OptionalsWide;

  init() {
    self.data = OptionalsWide{
      x1:null,x2:"a",x3:true,x4:5,x5:null,x6:"b",x7:null,x8:false,x9:null
    };
  }
}