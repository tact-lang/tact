struct Defaulted {
  a: Int = 0;
  b: String = "";
  c: Bool = false;
}

struct NoDefaults {
  x: Int;
  y: String;
  z: Bool;
}

contract Test27 {
  f1: Defaulted;
  f2: NoDefaults;

  init() {
    self.f1 = Defaulted{};
    self.f2 = NoDefaults{x:1,y:"hi",z:true};
  }
}