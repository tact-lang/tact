struct MixOpt {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
}

contract TestMixOpt {
  sfield: MixOpt?;

  init() {
    self.sfield = MixOpt{
      a:1, b:null, c:true, d:false
    };
  }
}