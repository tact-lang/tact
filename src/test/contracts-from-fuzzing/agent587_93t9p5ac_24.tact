struct Combo {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
}

contract ComboContract {
  x: Combo;
  y: Combo;
  z: Combo;

  init() {
    self.x = Combo{a:1, b:true,  c:null, d:null};
    self.y = Combo{a:2, b:false, c:null, d:null};
    self.z = Combo{a:3, b:true,  c:null, d:null};
  }
}