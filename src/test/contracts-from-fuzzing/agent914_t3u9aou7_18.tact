struct NestedSerialize {
  x: Int as uint4;
  y: Bool;
}

contract NestedSerializeContract {
  s: NestedSerialize;

  init() {
    self.s = NestedSerialize{x: 15, y: true};
  }
}