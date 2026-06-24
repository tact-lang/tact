struct Defaults {
  a: Int = 10;
  b: Bool = false;
  c: String = "hi";
}

contract DefFields {
  data: Defaults;

  init() {
    self.data = Defaults{};
  }
}