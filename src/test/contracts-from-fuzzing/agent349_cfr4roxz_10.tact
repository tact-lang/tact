struct OptionalBool {
  flag: Bool?;
}

contract OptBoolTest {
  data: OptionalBool;
  init() {
    self.data = OptionalBool{ flag: null };
  }
}