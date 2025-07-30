struct Uni {
  x: Int;
}

contract ArrayLike {
  x1: Uni;
  x2: Uni;
  x3: Uni;
  x4: Uni;

  init() {
    self.x1 = Uni{x:1};
    self.x2 = Uni{x:2};
    self.x3 = Uni{x:3};
    self.x4 = Uni{x:4};
  }
}
