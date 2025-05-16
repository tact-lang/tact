struct LayerA {
  x: Int;
  y: Bool;
}

struct LayerB {
  a: LayerA;
  b: LayerA;
}

struct LayerC {
  ba: LayerB;
  bb: LayerB;
}

contract StorageTest {
  root: LayerC;

  init() {
    self.root = LayerC{
      ba: LayerB{
        a: LayerA{ x:1,y:true },
        b: LayerA{ x:2,y:false }
      },
      bb: LayerB{
        a: LayerA{ x:3,y:true },
        b: LayerA{ x:4,y:false }
      }
    };
  }
}