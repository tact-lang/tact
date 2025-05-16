struct Rec1 {
  a: Int;
}

struct Rec2 {
  r1: Rec1;
}

struct Rec3 {
  r2: Rec2;
}

struct Rec4 {
  r3: Rec3;
}

contract LongNestedStructs {
  d: Rec4;

  init() {
    self.d = Rec4{ r3: Rec3{ r2: Rec2{ r1: Rec1{ a: 77 } } } };
  }
}