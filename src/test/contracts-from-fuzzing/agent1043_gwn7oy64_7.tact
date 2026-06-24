struct VeryDeepNested {
  layer1: Layer1;
}

struct Layer1 {
  layer2: Layer2;
}

struct Layer2 {
  layer3: Layer3;
}

struct Layer3 {
  layer4: Layer4;
}

struct Layer4 {
  val: String;
}

contract TestContract {
  nested: VeryDeepNested;
  init() {
    self.nested = VeryDeepNested{
      layer1: Layer1{
        layer2: Layer2{
          layer3: Layer3{
            layer4: Layer4{
              val: "deep"
            }
          }
        }
      }
    };
  }
}