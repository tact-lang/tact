struct OptDefaultS {
  a:Int?=null; b:Bool?=null; c:String?=null;
}

contract NestedOptDefaults {
  s: OptDefaultS;

  init() {
    self.s = OptDefaultS{
      a:null,
      b:null,
      c:null
    };
  }
}