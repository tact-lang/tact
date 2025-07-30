struct StructA {
  i: Int;
  b: Bool;
}

struct StructB {
  s: StructA;
  sOpt: StructA?;
}

contract MixedNestedOptionals {
  f: StructB;

  init() {
    self.f = StructB{
      s: StructA{ i:1, b:true },
      sOpt: null
    };
  }
}