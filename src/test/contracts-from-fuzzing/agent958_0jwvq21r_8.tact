struct InnerA {
  a1: Int;
  a2: Bool;
}

struct InnerB {
  b1: Int?;
  b2: String;
}

struct Outer {
  f1: InnerA;
  f2: InnerB;
}

contract DeepMixStructs {
  data: Outer;

  init() {
    self.data = Outer{
      f1: InnerA{ a1: 10, a2: false },
      f2: InnerB{ b1: null, b2: "hello" },
    };
  }
}
