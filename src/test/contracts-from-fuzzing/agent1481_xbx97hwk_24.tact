struct NestedStructs {
  first: InnerA;
  second: InnerB;
}

struct InnerA {
  x: Int;
  y: Bool;
}

struct InnerB {
  s: String;
  z: Int;
}

contract NestedStructsTest {
  dat: NestedStructs;
  init() {
    self.dat = NestedStructs{ first: InnerA{ x:1, y:true }, second: InnerB{ s:"X", z:2 } };
  }
}