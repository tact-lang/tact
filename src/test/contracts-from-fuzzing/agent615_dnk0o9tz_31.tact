struct EmptyDefaultOpt {
  foo: String? = null;
}

contract TestContract {
  x: EmptyDefaultOpt;

  init() {
    self.x = EmptyDefaultOpt{};
  }
}