struct S1 {
  a: Int;
  b: String;
}

struct S2 {
  c: Bool;
  d: S1;
}

contract NestedInStruct {
  s: S2;

  init() {
    self.s = S2{
      c:true,
      d:S1{a:1, b:"x"}
    };
  }
}