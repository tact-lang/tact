struct BoolLayer {
  x: Bool;
  y: Bool?;
}

contract BoolLayerContract {
  f: BoolLayer;

  init() {
    self.f = BoolLayer{x:true,y:null};
  }
}