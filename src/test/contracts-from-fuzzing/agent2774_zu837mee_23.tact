// optional persistent field with default null implicitly
contract TestContract {
  foo: Int?;

  init() {
    self.foo = null;
  }
}