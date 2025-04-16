struct DeepLevel {
  s: String;
}

struct MidLevel {
  inner: DeepLevel;
}

struct TopLevel {
  top: MidLevel;
}

contract ThreeLayerNested {
  root: TopLevel;

  init() {
    self.root = TopLevel {
      top: MidLevel {
        inner: DeepLevel {
          s: "depth"
        }
      }
    };
  }
}
