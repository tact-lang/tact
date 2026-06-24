struct DefaultsMix {
  a: Int = 10;
  b: String?;
  c: String = "x";
  d: Int?;
  e: Bool = false;
  f: Bool?;
}

contract MixedDefaultsOptionals {
  val: DefaultsMix;

  init() {
    self.val = DefaultsMix{};
  }
}
