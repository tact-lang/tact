struct OuterStruct {
  inner1: Int;
  inner2: Bool;
  inner3: Int?;
}

contract OptionalStructField {
  outer: OuterStruct?;

  init() {
    self.outer = null;
  }
}