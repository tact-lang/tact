struct InnerA { f1: Int; f2: Slice?; }
struct InnerB { f3: Bool; f4: String?; }
struct InnerC { f5: Address?; f6: Address; }

struct Outer {
  a: InnerA;
  b: InnerB;
  c: InnerC;
  s: String;
}

contract NestedManyStructs {
  d: Outer;

  init() {
    self.d = Outer{
      a: InnerA{ f1: 1, f2: null },
      b: InnerB{ f3: true, f4: null },
      c: InnerC{ f5: null, f6: myAddress() },
      s: "test"
    };
  }
}