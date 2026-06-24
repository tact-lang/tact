struct Rec1 {
  x: Int;
}

struct Rec2 {
  y: Bool;
}

contract OptionStructs {
  s1: Rec1?;
  s2: Rec2?;

  init() {
    self.s1 = Rec1{x:5};
    self.s2 = null;
  }
}