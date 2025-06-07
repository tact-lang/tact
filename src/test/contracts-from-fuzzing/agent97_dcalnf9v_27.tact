struct Deeply {
  x: Int;
  nestedOpt: Bool?;
  nestedDef: Int = 42;
}

contract MixedStructContract {
  foo: Deeply;
  init() {
    self.foo = Deeply{
      x: 10,
      nestedOpt: null
    };
  }
}