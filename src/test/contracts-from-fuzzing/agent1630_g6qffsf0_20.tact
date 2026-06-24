struct InnerInner {
  name: String;
}

struct Inner {
  part: InnerInner?;
}

contract DeepOptionalStruct {
  nested: Inner?;

  init() {
    self.nested = null;
  }
}