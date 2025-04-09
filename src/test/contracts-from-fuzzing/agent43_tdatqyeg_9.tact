struct Layer1 {
  a: Int;
}

struct Layer2 {
  nested1: Layer1;
  nested2: Layer1;
}

struct Layer3 {
  innerLayer: Layer2;
}

contract DeepLayers {
  val: Layer3;

  init() {
    self.val = Layer3{
      innerLayer: Layer2{
        nested1: Layer1{ a: 1 },
        nested2: Layer1{ a: 2 }
      }
    };
  }
}