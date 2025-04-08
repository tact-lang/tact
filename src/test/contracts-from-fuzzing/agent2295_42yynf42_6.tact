struct SomeStruct {
  foo: Int;
  bar: Bool;
}

contract Test {
  s1: SomeStruct;
  s2: SomeStruct;

  init() {
    self.s1 = SomeStruct{ foo: 1, bar: true };
    self.s2 = SomeStruct{ foo: 2, bar: false };
  }
}