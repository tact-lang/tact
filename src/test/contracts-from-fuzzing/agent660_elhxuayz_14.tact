struct Nullables {
  x: Int?;
  y: Bool?;
  z: Address?;
}

contract NullDefaultsTest {
  data: Nullables;

  init() {
    self.data = Nullables{};
  }
}