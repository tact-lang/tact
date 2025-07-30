struct OptionalOuter {
  inner: DefiniteInner?;
}

struct DefiniteInner {
  flag: Bool?;
  text: String?;
}

contract NestedOptionalsMix {
  state: OptionalOuter?;

  init() {
    self.state = null;
  }
}