struct Rec {
  x: Int?;
  y: Bool?;
}

contract OptMix {
  a: Rec? = null;
  b: Rec?;
  c: Int? = null;

  init() {
    self.b = null;
    self.c = 42;
  }
}
