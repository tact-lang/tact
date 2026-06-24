struct BoolMix {
  flagA: Bool;
  flagB: Bool?;
}

contract Test {
  a: BoolMix;
  b: BoolMix;

  init() {
    self.a = BoolMix{ flagA:true, flagB:null };
    self.b = BoolMix{ flagA:false, flagB:null };
  }
}