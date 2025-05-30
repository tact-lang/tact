struct DeepOptionalNested {
  inner: Int?;
}

struct Wrapper {
  nested: DeepOptionalNested?;
}

contract DeepOpt {
  val: Wrapper?;

  init() {
    self.val = null;
  }
}