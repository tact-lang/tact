struct InnerLevel {
  a: Bool;
  b: Int?;
}

struct TopLevel {
  l1: InnerLevel?;
  l2: InnerLevel;
  l3: Int?;
}

contract DeepOptional {
  s: TopLevel;

  init() {
    self.s = TopLevel{
      l1: InnerLevel{ a: true, b: null },
      l2: InnerLevel{ a: false, b: 5 },
      l3: null
    };
  }
}