struct ManyOptionalDefaults {
  a: Int? = null;
  b: Int? = null;
  c: String? = null;
  d: Cell? = null;
  e: Slice? = null;
}

contract StructOptDefaultsTest {
  data: ManyOptionalDefaults;

  init() {
    self.data = ManyOptionalDefaults{};
  }
}