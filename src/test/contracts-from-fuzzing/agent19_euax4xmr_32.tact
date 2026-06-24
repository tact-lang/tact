struct DeepInner {
  val: Int?;
}

struct Middle {
  nestedVal: DeepInner?;
}

contract Test {
  s: Middle?;

  init() {
    self.s = Middle{
      nestedVal: null
    };
  }
}