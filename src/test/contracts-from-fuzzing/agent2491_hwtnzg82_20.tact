struct Rec1 {
  rec2: Rec2;
}

struct Rec2 {
  rec3: Rec3;
}

struct Rec3 {
  value: Int;
}

contract RecursiveLike {
  val: Rec1;

  init() {
    self.val = Rec1{rec2: Rec2{rec3: Rec3{value: 77}}};
  }
}