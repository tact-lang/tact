struct InnerMost {
  f1: Int;
}

struct Inner {
  f2: Bool;
  nested: InnerMost;
}

contract StructWithNestedStructAndPrimitives {
  a: Int;
  s: Inner;
  b: Bool;

  init() {
    self.a = 7;
    self.b = false;
    self.s = Inner{
      f2:true,
      nested:InnerMost{f1:123}
    };
  }
}