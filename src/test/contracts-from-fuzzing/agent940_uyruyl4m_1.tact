struct InnerLevel {
  z: Int;
}

struct OuterLevel {
  inner: InnerLevel;
  y: Int;
}

contract DeepNestTest {
  val: OuterLevel;

  init() {
    self.val = OuterLevel{
      inner: InnerLevel{ z: 123 },
      y: 456
    };
  }
}