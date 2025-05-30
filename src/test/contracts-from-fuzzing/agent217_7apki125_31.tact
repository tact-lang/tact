struct OuterData {
  a: Int;
  b: InnerData?;
}

struct InnerData {
  c: Int;
  d: Bool?;
}

contract OptNestedFields {
  data: OuterData?;

  init() {
    self.data = null;
  }
}