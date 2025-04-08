struct InnerMost {
  f1: Int = 1;
  f2: Bool?;
}

struct Middle {
  a: InnerMost;
  b: Int?;
  c: Bool;
}

struct Outer {
  x: Middle;
  y: Bool = false;
}

contract ComplexStorage {
  myData: Outer;

  init() {
    self.myData = Outer{
      x: Middle{
        a: InnerMost{ f1: 5, f2: true },
        b: null,
        c: true
      },
      y: false
    };
  }
}