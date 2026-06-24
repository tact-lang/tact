struct ManyLayer {
  x: LayerA;
}

struct LayerA {
  y: LayerB;
}

struct LayerB {
  z: LayerC;
}

struct LayerC {
  w: Int;
}

contract MultiNest {
  deep: ManyLayer;

  init() {
    self.deep = ManyLayer{
      x: LayerA{
        y: LayerB{
          z: LayerC{
            w: 77
          }
        }
      }
    };
  }
}