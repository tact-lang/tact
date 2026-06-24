struct DeepOptInner {
  x: Int?;
  y: Bool?;
}

struct DeepOptOuter {
  i: Int;
  nested: DeepOptInner?;
}

contract DeepOptionalNested {
  s: DeepOptOuter = DeepOptOuter{ i: 5, nested: null };
  init() {
    self.s = DeepOptOuter{ i: 10, nested: DeepOptInner{ x: 20, y: true } };
  }
  receive() {}
}