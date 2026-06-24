struct RecX {
  val: Int?;
}

struct RecY {
  next: RecX?;
}

contract RecursiveOpt {
  f: RecY;

  init() {
    self.f = RecY{ next: null };
  }
}