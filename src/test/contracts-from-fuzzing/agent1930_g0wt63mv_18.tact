struct MultiLayerOptionals {
  layer1: Layer2?;
}

struct Layer2 {
  layer3: Layer3?;
}

struct Layer3 {
  innerVal: Int?;
}

contract OptionalLayers {
  val: MultiLayerOptionals;

  init() {
    self.val = MultiLayerOptionals{
      layer1: Layer2{
        layer3: Layer3{ innerVal: 100 }
      }
    };
  }
}