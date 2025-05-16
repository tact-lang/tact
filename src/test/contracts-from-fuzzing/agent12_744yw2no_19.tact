struct Toplevel {
  inner1: InnerA;
  inner2: InnerB;
}

struct InnerA {
  a: Int;
  b: Bool;
}

struct InnerB {
  c: String;
  d: Int;
}

contract MultiNested {
  data: Toplevel;

  init() {
    self.data = Toplevel{
      inner1: InnerA{ a:1, b:true },
      inner2: InnerB{ c:"x", d:42 }
    };
  }
}
