struct SDeep {
  x: Int;
  y: Bool;
}

struct Middle {
  inner: SDeep;
  opt: Int?;
}

contract NestedInsideStorage {
  state: Middle;

  init() {
    self.state = Middle{
      inner: SDeep{ x: 101, y: true },
      opt: 123
    };
  }
}
