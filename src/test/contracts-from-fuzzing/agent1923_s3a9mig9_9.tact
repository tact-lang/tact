contract OptionalStructField {
  s: Struct1?;

  init() {
    self.s = null;
  }
}

struct Struct1 {
  x: Int;
  y: Bool;
}