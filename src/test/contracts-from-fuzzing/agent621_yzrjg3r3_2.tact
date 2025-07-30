struct DeeplyNested {
  a: InnerMost;
}

struct InnerMost {
  x: Int;
  y: Bool?;
  z: Leaf;
}

struct Leaf {
  value: Int;
}

contract Test {
  info: DeeplyNested;

  init() {
    self.info = DeeplyNested{
      a: InnerMost{
        x: 5,
        y: null,
        z: Leaf{ value: 10 },
      }
    };
  }
}
