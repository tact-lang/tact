struct MultiLayer {
  innermost: Int;
}

struct Layer2 {
  m: MultiLayer;
}

struct Layer1 {
  l: Layer2;
}

struct Layer0 {
  k: Layer1;
}

contract FourLayers {
  top: Layer0;

  init() {
    self.top = Layer0{
      k: Layer1{
        l: Layer2{
          m: MultiLayer{
            innermost: 99
          }
        }
      }
    };
  }
}