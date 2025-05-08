struct ManyPrims {
  i: Int;
  b: Bool;
  s: String;
  oi: Int?;
  ob: Bool?;
  os: String?;
}

contract PrimStore {
  x: ManyPrims;

  init() {
    self.x = ManyPrims{
      i:1,b:true,s:"str",oi:null,ob:null,os:null
    };
  }
}