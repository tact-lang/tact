struct InnerDeep {
  x: Int;
  y: Int?;
}

struct Mid {
  m1: Int;
  deep: InnerDeep;
  optDeep: InnerDeep?;
}

contract DeepNestedStorage {
  data: Mid;

  init() {
    self.data = Mid{
      m1: 42,
      deep: InnerDeep{ x: 1, y: null },
      optDeep: null
    };
  }
}