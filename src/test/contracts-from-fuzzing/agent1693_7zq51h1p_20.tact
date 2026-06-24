struct LargeNested {
  a: Int;
  b: Int;
  c: Int;
  d: Int;
}

struct Container {
  x: LargeNested;
  y: LargeNested;
  z: LargeNested;
}

contract BigNestedArrayLike {
  val: Container;

  init() {
    self.val = Container{
      x: LargeNested{ a:1,b:2,c:3,d:4 },
      y: LargeNested{ a:5,b:6,c:7,d:8 },
      z: LargeNested{ a:9,b:10,c:11,d:12 }
    };
  }
}