// Test contract that initializes optional struct containing inner with defaults
struct InnerD {
  x: Int;
}

struct ContainerD {
  val: Int;
  inner: InnerD?;
}

contract OptionalComplexInit {
  f: ContainerD?;
  init() {
    self.f = null;
  }
}
