struct Layer3 {
  a: Int;
  b: String;
}

struct Layer2 {
  layer3: Layer3;
  f: Bool;
}

struct Layer1 {
  layer2: Layer2;
}

contract DeepLayers {
  nested: Layer1;

  init() {
    self.nested = Layer1{
      layer2: Layer2{
        layer3: Layer3{
          a: 123,
          b: "abc"
        },
        f: true
      }
    };
  }
}
