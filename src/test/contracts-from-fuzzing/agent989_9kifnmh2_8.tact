struct Defaults {
  a: Int = 42;
  b: Bool = true;
  c: String = "hello";
}

contract DefaultsContract {
  defField: Defaults;

  init() {
    self.defField = Defaults{};
  }
}