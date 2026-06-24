struct DeepInner {
  a: Int? = null;
  b: Int = 5;
}

struct Mid {
  inner: DeepInner? = null;
}

struct Outer {
  mid: Mid = Mid{};
}

contract OptionalDeep {
  field: Outer = Outer{};
  init() {}
}
