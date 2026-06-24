struct NestedOptional {
  x: Int?;
  y: String?;
}

struct Mixed {
  foo: Int;
  bar: NestedOptional?;
}

contract MixedOptionals {
  m: Mixed;
  init() {
    self.m = Mixed{ foo: 1, bar: null };
  }
}