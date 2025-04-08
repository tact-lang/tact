struct Midlvl {
  a: Int;
  b: Bool;
}

struct Toplvl {
  m1: Midlvl;
  m2: Midlvl;
  m3: Midlvl;
}

contract Test {
  top: Toplvl;

  init() {
    self.top = Toplvl{
      m1:Midlvl{a:1,b:true},
      m2:Midlvl{a:2,b:false},
      m3:Midlvl{a:3,b:true}
    };
  }
}