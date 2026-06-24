struct NestedMany {
  a: Int;
  b: Int;
  c: Int;
  d: Int;
  e: Int;
  f: Int;
}

struct Outer {
  x: NestedMany;
  y: Bool;
}

contract StructInStructMany {
  s: Outer;

  init() {
    self.s = Outer{
      x: NestedMany{
        a:1,b:2,c:3,d:4,e:5,f:6
      },
      y: true
    };
  }
}
