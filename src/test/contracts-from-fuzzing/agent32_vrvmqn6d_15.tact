struct Combo {
  a: Int;
  b: String;
  c: Bool;
  d: Int?;
  e: String?;
  f: Bool?;
}

contract Test {
  combo: Combo;
  init() {
    self.combo = Combo{
      a:1,b:"b",c:true,d:null,e:null,f:null
    };
  }
}