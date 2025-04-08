struct Rec {
 x: Int;
 y: String;
 z: Bool?;
}

contract BigMany {
  a: Rec;
  b: Rec;
  c: Rec;
  d: Rec;
  e: Rec;
  f: Rec;

  init() {
    self.a = Rec{ x:1, y:"a", z:true };
    self.b = Rec{ x:2, y:"b", z:null };
    self.c = Rec{ x:3, y:"c", z:false };
    self.d = Rec{ x:4, y:"d", z:null };
    self.e = Rec{ x:5, y:"e", z:true };
    self.f = Rec{ x:6, y:"f", z:false };
  }
}
