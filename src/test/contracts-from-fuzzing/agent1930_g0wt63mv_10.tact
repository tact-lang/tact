struct Wide {
  f1: Int;
  f2: Int;
  f3: Int;
  f4: Bool;
  f5: Bool;
  f6: String;
  f7: Bool?;
  f8: Int?;
  f9: String?;
  f10: Address?;
}

contract WideFields {
  data: Wide;

  init() {
    self.data = Wide{
      f1:1, f2:2, f3:3, f4:true, f5:false,
      f6:"hi", f7:null, f8:99, f9:null, f10:null
    };
  }
}