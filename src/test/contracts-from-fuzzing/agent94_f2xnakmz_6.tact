struct DefaultVals {
  foo: Int = 42;
  bar: String = "ok";
  baz: Bool?; // implicitly null
}

contract Defaults {
  val: DefaultVals;

  init() {
    self.val = DefaultVals{};
  }
}