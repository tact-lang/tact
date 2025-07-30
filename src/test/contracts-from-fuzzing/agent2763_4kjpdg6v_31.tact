struct NestedDeepOpt {
  level1: Int?;
  level2: Int?;
  level3: Int?;
}

struct Outer {
  nest: NestedDeepOpt?;
}

contract NullableNestedOpt {
  data: Outer;

  init() {
    self.data = Outer{ nest: null };
  }
}