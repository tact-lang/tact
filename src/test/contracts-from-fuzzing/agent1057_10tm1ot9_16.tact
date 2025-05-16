struct Rec1 {
  next: Rec2?;
  x: Int;
}

struct Rec2 {
  next: Rec3?;
  y: Bool;
}

struct Rec3 {
  z: String?;
}

contract RecursiveLike {
  data: Rec1;

  init() {
    self.data = Rec1{
      next: null,
      x: 5
    };
  }
}