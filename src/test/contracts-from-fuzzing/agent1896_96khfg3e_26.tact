struct MultiNested {
  a: NestedA;
  b: NestedB;
}

struct NestedA {
  x: Int; y: String;
}

struct NestedB {
  flag: Bool; inner: NestedC;
}

struct NestedC {
  val: Int;
}

contract MultiDepth {
  payload: MultiNested;

  init() {
    self.payload = MultiNested{
      a: NestedA{ x:1, y:"x" },
      b: NestedB{ flag:true, inner:NestedC{ val:123 } }
    };
  }
}