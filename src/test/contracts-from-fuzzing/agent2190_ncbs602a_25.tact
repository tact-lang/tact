struct SOptDefault {
  a: Int? = null;
  b: Int;
}

contract NestedWithPartialDefaults {
  s: SOptDefault;

  init() {
    self.s = SOptDefault{b:5};
  }
}