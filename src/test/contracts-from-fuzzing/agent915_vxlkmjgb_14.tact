struct Nested {
  one: Bool;
  two: Int as uint16;
}

contract OptionalDeepNested {
  st: Nested?;

  init() {
    self.st = null;
  }
}
