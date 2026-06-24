struct Defaults {
  intVal: Int = 42;
  boolVal: Bool = true;
  strVal: String = "hi";
}

contract DefaultValuesTest {
  d: Defaults;

  init() {
    self.d = Defaults{};
  }
}