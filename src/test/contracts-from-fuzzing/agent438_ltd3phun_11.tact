struct S {
  f1: Int = 42;
  f2: Int?;
}

contract TestContract {
  data: S?;

  init() {
    self.data = S{};
  }
}