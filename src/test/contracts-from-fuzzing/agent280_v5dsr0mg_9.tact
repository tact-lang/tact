struct Layer3 {
  z: Int;
}

struct Layer2 {
  y: Layer3;
}

struct Layer1 {
  x: Layer2;
}

struct Container {
  l1: Layer1;
}

contract StructInStruct {
  bundle: Container;

  init() {
    self.bundle = Container{
      l1: Layer1{
        x: Layer2{
          y: Layer3{ z: 123 }
        }
      }
    };
  }
}