struct LargeNested {
  a: Int;
  b: Int;
  c: Int;
  d: InnerLarge;
}

struct InnerLarge {
  w: Int;
  x: Int;
  y: Int;
  z: Int;
}

contract NestedMany {
  s: LargeNested;
  init() {
    self.s = LargeNested{
      a: 1, b:2, c:3, d: InnerLarge{w:4,x:5,y:6,z:7}
    };
  }
}