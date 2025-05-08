struct BigDefaults {
  a: Int = 10;
  b: Int?; // default null
  c: Bool = false;
  d: Address?; // default null
  e: Int as int64 = 1234;
}

contract DefaultsTest {
  dt: BigDefaults;

  init() {
    self.dt = BigDefaults{};
  }
}