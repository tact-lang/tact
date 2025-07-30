struct SDefault {
  foo: Int = 99;
}

contract DefaultStructFieldContract {
  s: SDefault;

  init() {
    self.s = SDefault{};
  }
}