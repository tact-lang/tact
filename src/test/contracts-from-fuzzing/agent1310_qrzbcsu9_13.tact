struct InnerA {
  s: String;
}

struct InnerB {
  i: Int;
}

struct Outer {
  a: InnerA;
  b: InnerB;
}

contract CombineStructs {
  data: Outer;

  init() {
    self.data = Outer{
      a: InnerA{ s: "hi" },
      b: InnerB{ i: 123 }
    };
  }
}