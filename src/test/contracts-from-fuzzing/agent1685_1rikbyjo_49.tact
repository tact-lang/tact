struct DeepNullable {
  sub: Int?;
}

struct TopLayer {
  inner: DeepNullable?;
}

contract NullableMix {
  state: TopLayer;

  init() {
    self.state = TopLayer{
      inner: null
    };
  }
}
