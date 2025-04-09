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
  flag: Bool;
}

contract TestContract {
  nested: Layer1;

  init() {
    self.nested = Layer1{
      layer2: Layer2{
        layer3: Layer3{
          layer4: Layer4{
            flag: true
          }
        }
      }
    };
  }
}