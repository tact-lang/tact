struct SubS {
  m: Int;
  n: Bool;
}

contract NestedStructWithDefaults {
  s: SubS = SubS{m: 1, n: true};

  init() {
    self.s = SubS{m: 42, n: false};
  }
}