struct S {
  field1: Int = 1;
  field2: Bool? = null;
  field3: String? = null;
}

contract MixedWithDefaults {
  data: S;

  init() {
    self.data = S{};
  }
}