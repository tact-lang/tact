struct SmallAB { a: Int; b: Int; }
struct SmallCD { c: Int; d: Int; }

contract MultiSmallStructs {
  f1: SmallAB;
  f2: SmallCD;

  init() {
    self.f1 = SmallAB{a:1,b:2};
    self.f2 = SmallCD{c:3,d:4};
  }
}