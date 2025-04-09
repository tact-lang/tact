struct DeepDefault {
  a: Int? = null;
  b: Bool = false;
}

contract OverwriteDefaults {
  d: DeepDefault;

  init() {
    self.d = DeepDefault{
      a: 5,
      b: true
    };
  }
}