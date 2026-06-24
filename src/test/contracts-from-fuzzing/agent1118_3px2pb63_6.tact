struct HasBool {
  flag1: Bool;
  flag2: Bool;
}

contract BoolFieldsTest {
  data: HasBool;
  other: Bool;

  init() {
    self.data = HasBool{ flag1: true, flag2: false };
    self.other = true;
  }
}