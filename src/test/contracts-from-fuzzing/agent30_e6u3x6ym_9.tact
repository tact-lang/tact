struct WithOptionals {
  foo: Int?;
  bar: Bool?;
  baz: Cell?;
}

contract Test {
  nestedOpt: WithOptionals;

  init() {
    self.nestedOpt = WithOptionals{};
  }
}