struct Combo {
  a:Int; b:Bool; s:String;
  oa:Int?; ob:Bool?; os:String?;
}

struct WrapCombo {
  x: Combo;
  y: Combo;
}

contract DoubleCombo {
  c: WrapCombo;

  init() {
    self.c = WrapCombo{
      x: Combo{a:1,b:true,s:"a",oa:null,ob:true,os:null},
      y: Combo{a:2,b:false,s:"b",oa:3,ob:null,os:"c"}
    };
  }
}