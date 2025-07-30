struct InnerLevel {
  s: String;
}

struct OuterLevel {
  maybeInner: InnerLevel?;
}

contract OptionalNestedStructField {
  outer: OuterLevel?;

  init() {
    self.outer = null;
  }
}