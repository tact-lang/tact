struct DefaultOpt {
  foo: Int? = null;
  bar: Bool? = null;
}

contract TestContract {
  d: DefaultOpt;
  init() {
    self.d = DefaultOpt{};
  }
}