struct InnerLayer {
  s: String;
  f: Bool;
}

struct OuterLayer {
  one: InnerLayer;
  two: InnerLayer?;
}

contract OptionalStructs {
  outer: OuterLayer?;

  init() {
    self.outer = null;
  }
}