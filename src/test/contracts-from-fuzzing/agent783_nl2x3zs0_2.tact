struct InnerMost {
  val: Int?;
}

struct Inner {
  innerMost: InnerMost?;
  flag: Bool;
}

struct Outer {
  inner: Inner?;
  message: String;
}

contract DeepNested {
  data: Outer?;

  init() {
    self.data = null;
  }
}