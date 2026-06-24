struct Rec {
  x: Int;
  y: String;
}

contract RecOptMix {
  a: Rec?;
  b: Rec;

  init() {
    self.a = null;
    self.b = Rec{x:1,y:"y"};
  }
}