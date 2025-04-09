struct EmptyDefaults {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: Cell?;
}

contract TestNullDefaults {
  data: EmptyDefaults;

  init() {
    self.data = EmptyDefaults{};
  }
}