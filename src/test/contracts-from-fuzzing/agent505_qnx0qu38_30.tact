struct Rec1 {
  a: Int;
}

struct Rec2 {
  r: Rec1;
}

struct Rec3 {
  r2: Rec2;
  b: Bool;
}

contract RecChain {
  item: Rec3 = Rec3{ r2: Rec2{ r: Rec1{ a: 88 } }, b: true };

  init() {
    self.item = self.item;
  }

  receive() {
    self.item = self.item;
  }
}