struct DeepOptionals {
  opt1: OptMiddle?;
}

struct OptMiddle {
  opt2: OptLeaf?;
}

struct OptLeaf {
  val: Int;
}

contract DeepOptionalChainTest {
  v: DeepOptionals;

  init() {
    self.v = DeepOptionals{ opt1: null };
  }
}