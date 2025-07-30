struct LayerA {
  x: Int;
}

struct LayerB {
  a: LayerA;
  y: Bool;
}

struct LayerC {
  b: LayerB;
  z: String;
}

contract LayeredContract {
  c: LayerC;

  init() {
    self.c = LayerC{
      b: LayerB{ a: LayerA{ x: 1 }, y: true },
      z: "z"
    };
  }
}