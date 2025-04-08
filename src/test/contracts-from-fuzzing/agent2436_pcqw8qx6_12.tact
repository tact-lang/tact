struct ManyOptionalStructs {
  o1: Int?;
  o2: Bool?;
  o3: String?;
  o4: Int?;
  o5: Bool?;
  o6: String?;
}

contract ManyOpts {
  opts: ManyOptionalStructs;

  init() {
    self.opts = ManyOptionalStructs{
      o1:null,
      o2:null,
      o3:null,
      o4:null,
      o5:null,
      o6:null
    };
  }
}