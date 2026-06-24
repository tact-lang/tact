struct InnerA { a: Int; }
struct InnerB { b: Int; }
struct InnerC { c: Int; }

struct Outer {
  i1: InnerA;
  i2: InnerB;
  i3: InnerC;
}

contract MultiNestDiff {
  data: Outer;

  init() {
    self.data = Outer{
      i1: InnerA{a:1},
      i2: InnerB{b:2},
      i3: InnerC{c:3}
    };
  }
}