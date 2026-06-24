struct MultiOptionNested {
  a: InnerOption?;
  b: InnerOption?;
  c: InnerOption?;
}

struct InnerOption {
  x: Int?;
}

contract Test {
  m: MultiOptionNested;
  init() {
    self.m = MultiOptionNested{
      a: null,
      b: null,
      c: null
    };
  }
}