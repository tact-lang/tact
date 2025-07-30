struct OptionalContainer {
  foo: Int?;
}

contract ImplicitNullOptional {
  val: OptionalContainer;

  init() {
    self.val = OptionalContainer{};
  }
}