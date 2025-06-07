struct InnerMost {
  value: Int;
}

struct Inner {
  nested: InnerMost?;
}

contract NestedOptionalsX2 {
  data: Inner?;

  init() {
    self.data = null;
  }
}