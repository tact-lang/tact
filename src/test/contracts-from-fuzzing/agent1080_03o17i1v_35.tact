struct DeepNullable {
  layer1: Int?;
  layer2: Int?;
  layer3: Int?;
  layer4: Int?;
  layer5: Int?;
}

contract MultiOpt {
  data: DeepNullable;

  init() {
    self.data = DeepNullable{
      layer1: null,
      layer2: null,
      layer3: null,
      layer4: null,
      layer5: null,
    };
  }
}