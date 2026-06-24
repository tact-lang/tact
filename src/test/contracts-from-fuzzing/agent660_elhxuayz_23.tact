struct BoolDefault {
  flag1: Bool = true;
  flag2: Bool = false;
}

contract BoolDefaultTest {
  data: BoolDefault;

  init() {
    self.data = BoolDefault{};
  }
}