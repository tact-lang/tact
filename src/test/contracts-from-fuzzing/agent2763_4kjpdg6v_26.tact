struct Combo {
  i: Int;
  b: Bool;
  a: Address;
  s: String;
  optInt: Int?;
  optBool: Bool?;
  optAddr: Address?;
  optStr: String?;
}

contract ManyCombos {
  c1: Combo;
  c2: Combo;

  init() {
    self.c1 = Combo{
      i:1,b:true,a:myAddress(),s:"a",optInt:null,optBool:null,optAddr:null,optStr:null
    };
    self.c2 = Combo{
      i:2,b:false,a:myAddress(),s:"b",optInt:null,optBool:null,optAddr:null,optStr:null
    };
  }
}