struct OptionalWrapper {
  opt: Int?;
}

contract TestContract {
  w1: OptionalWrapper;
  w2: OptionalWrapper;

  init() {
    self.w1 = OptionalWrapper{ opt: null };
    self.w2 = OptionalWrapper{ opt: null };
  }
}