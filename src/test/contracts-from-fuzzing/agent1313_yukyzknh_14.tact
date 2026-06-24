struct Rec {
  n: Int;
  s: String;
}

contract RecMix {
  a: Rec;
  b: Int;
  c: Bool;
  d: String;

  init() {
    self.a = Rec{n:1,s:"x"};
    self.b = 10;
    self.c = false;
    self.d = "y";
  }
}