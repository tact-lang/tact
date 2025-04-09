struct ABool {
  f: Bool;
}

contract OptionalBoolStruct {
  s: ABool?;

  init() {
    self.s = null;
  }
}