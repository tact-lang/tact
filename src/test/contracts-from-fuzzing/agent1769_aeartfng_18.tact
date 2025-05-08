struct Layer2 {
  x: Int;
}

struct Layer1 {
  layer: Layer2;
}

contract TwoLayerStruct {
  l1: Layer1;

  init() {
    self.l1 = Layer1{
      layer: Layer2{ x: 42 }
    };
  }
}