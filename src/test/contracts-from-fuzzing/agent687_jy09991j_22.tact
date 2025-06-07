struct DefaultMix {
  a: Int = 123;
  b: Bool = false;
  c: String = "default";
  d: Int? = null;
  e: Bool? = null;
  f: String? = null;
}

contract DefaultMixTest {
  val: DefaultMix;

  init() {
    self.val = DefaultMix{};
  }
}