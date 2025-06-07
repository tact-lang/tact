struct DeepDefault {
  intField: Int = 42;
  boolField: Bool = true;
  strField: String = "ok";
}

contract DefaultsInNested {
  f: DeepDefault;

  init() {
    self.f = DeepDefault{};
  }
}