struct DeeplyNested1 {
  a: Int;
}

struct DeeplyNested2 {
  s1: DeeplyNested1;
  b: Bool;
}

struct DeeplyNested3 {
  s2: DeeplyNested2;
  s1opt: DeeplyNested1?;
}

contract DeepNesting {
  data: DeeplyNested3;

  init() {
    self.data = DeeplyNested3{
      s2: DeeplyNested2{
        s1: DeeplyNested1{a:42},
        b: true,
      },
      s1opt: null,
    };
  }
}