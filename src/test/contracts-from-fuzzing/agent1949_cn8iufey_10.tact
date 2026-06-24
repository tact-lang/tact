struct InnerOptional {
  a: Int?;
  b: Bool?;
  c: String?;
}

struct OuterOptional {
  x: InnerOptional?;
  y: InnerOptional?;
}

contract NestedOptionalsTest {
  val: OuterOptional;

  init() {
    self.val = OuterOptional{
      x: null,
      y: null
    };
  }
}
