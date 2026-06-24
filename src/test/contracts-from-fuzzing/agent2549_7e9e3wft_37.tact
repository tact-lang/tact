struct Layer {
  v1: Int?;
  v2: Bool?;
}

struct Top {
  l1: Layer?;
  l2: Layer;
}

contract MixedOptionals {
  data: Top;

  init() {
    self.data = Top{
      l1: null,
      l2: Layer{ v1: null, v2: true }
    };
  }
}