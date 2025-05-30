struct OptionalsEverywhere {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Int?;
  e: Bool?;
  f: String?;
  g: Int?;
  h: Bool?;
  i: String?;
}

contract OmnipresentNull {
  fld: OptionalsEverywhere;
  init() {
    self.fld = OptionalsEverywhere{
      a:null, b:true, c:null, d:99, e:null, f:"f",
      g:null, h:false, i:null,
    };
  }
}