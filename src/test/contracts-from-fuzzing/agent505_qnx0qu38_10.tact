struct TripleNested {
  level1: Int = 11;
  level2: Bool = false;
  level3: String = "deep";
}

struct Wrap {
  content: TripleNested;
}

contract Wrapped {
  layer: Wrap = Wrap{ content: TripleNested{} };

  init() {
    self.layer = self.layer;
  }

  receive() {
    self.layer = self.layer;
  }
}