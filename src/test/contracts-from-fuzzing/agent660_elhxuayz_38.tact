struct CompositeDefaults {
  a: Int = 1;
  b: Bool = true;
  c: String = "x";
  d: Address;
}

contract CompositeDefaultsTest {
  data: CompositeDefaults;

  init() {
    self.data = CompositeDefaults{
      d: myAddress(),
    };
  }
}