struct DeepNested {
  inner: Inner;
}

struct Inner {
  val1: Int;
  val2: Bool;
}

contract DeepStructTest {
  deep: DeepNested;

  init() {
    self.deep = DeepNested{inner: Inner{val1: 42, val2: true}};
  }
}