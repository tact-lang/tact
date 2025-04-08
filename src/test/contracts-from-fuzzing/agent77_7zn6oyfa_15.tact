struct Foo {
  x: Int;
}

contract MixDefaults {
  a: Int = 5;
  b: Bool;
  c: Bool = true;
  d: Foo;
  
  init() {
    self.b = false;
    self.d = Foo{ x: 42 };
  }
}