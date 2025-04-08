struct LayerOpt {
  lv:Int?;
}
struct WrapLayer {
  lay:LayerOpt?;
}

contract NestedLayerOpt {
  w:WrapLayer;

  init(){
    self.w=WrapLayer{lay:null};
  }
}