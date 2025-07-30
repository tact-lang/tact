struct Defaults1 {
  a: Int = 1;
}
struct Defaults2 {
  b: Int = 2;
}

contract ManyDefaults {
  d1: Defaults1;
  d2: Defaults2;

  init() {
    self.d1 = Defaults1{};
    self.d2 = Defaults2{};
  }
}