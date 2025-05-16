struct AA {
  a: Int;
}

contract SameTwice {
  f1: AA;
  f2: AA;

  init() {
    self.f1 = AA{a: 1};
    self.f2 = AA{a: 2};
  }
}