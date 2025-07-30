struct NestedStr1 {
  a: Int;
  b: Int;
}

struct NestedStr2 {
  s: NestedStr1;
  c: Int;
}

struct NestedStr3 {
  s2: NestedStr2;
  d: Int;
}

contract DeepChain {
  s3: NestedStr3;

  init() {
    self.s3 = NestedStr3{
      s2: NestedStr2{
        s: NestedStr1{ a:1, b:2 },
        c:3,
      },
      d:4
    };
  }
}