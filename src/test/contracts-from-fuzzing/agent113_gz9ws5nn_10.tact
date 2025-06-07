struct Rec1 {
  next: Rec2?;
}

struct Rec2 {
  next: Rec3?;
}

struct Rec3 {
  leaf: Int;
}

contract DeepRecursionOpt {
  r: Rec1;

  init() {
    self.r = Rec1{ next: Rec2{ next: Rec3{leaf: 42} } };
  }
}