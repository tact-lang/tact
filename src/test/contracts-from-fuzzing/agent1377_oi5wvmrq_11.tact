struct Defaults {
  foo: Int = 11;
  bar: Bool = true;
  label: String = "default";
}

contract TestContract {
  data: Defaults;

  init() {
    self.data = Defaults{};
  }
}