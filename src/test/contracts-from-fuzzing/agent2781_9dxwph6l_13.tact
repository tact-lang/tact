struct InnerMost {
  v: Int? = null;
}

struct Mid {
  midVal: InnerMost? = null;
}

struct Outer {
  outVal: Mid = Mid{};
}

contract Test {
  data: Outer = Outer{};
}