struct Defaults {
  a: Int = 1;
  b: String = "hello";
  c: Bool = false;
}

contract DefaultsContract {
  data: Defaults;

  init() {
    self.data = Defaults{};
  }
}