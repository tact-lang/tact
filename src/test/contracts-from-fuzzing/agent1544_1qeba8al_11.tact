struct DeepOptional {
  layer1: Layer1?;
}

struct Layer1 {
  layer2: Layer2?;
}

struct Layer2 {
  layer3: Layer3?;
}

struct Layer3 {
  val: Int;
}

contract NestedNulls {
  deep: DeepOptional;

  init() {
    self.deep = DeepOptional{
      layer1: null
    };
  }
}
