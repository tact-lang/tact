struct ManyOpt {
  o1: Int?;
  o2: Int?;
  o3: Int?;
  o4: Bool?;
  o5: Bool?;
}

contract MultiOptFields {
  s: ManyOpt;

  init() {
    self.s = ManyOpt{
      o1:null,o2:1,o3:null,o4:true,o5:null
    };
  }
}