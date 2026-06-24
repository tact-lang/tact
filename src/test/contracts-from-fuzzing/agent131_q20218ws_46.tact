struct FooBar {
  foo: Int;
  bar: Bool;
}

contract DefaultedWhole {
  s: FooBar = FooBar{ foo:1, bar:false };

  init() {
    self.s = FooBar{ foo:2, bar:true };
  }
}