struct Rec1 {
  next: Rec2;
}

struct Rec2 {
  x: Int;
}

contract Test {
  r: Rec1;
  init() {
    self.r = Rec1{ next: Rec2{ x: 42 } };
  }
}