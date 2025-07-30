struct LayerTwo {
  first: Int?;
  second: Bool?;
}

struct LayerOne {
  embedded: LayerTwo?;
}

contract DoubleOptionalLayers {
  content: LayerOne;
  init() {
    self.content = LayerOne{
      embedded: null
    };
  }
}