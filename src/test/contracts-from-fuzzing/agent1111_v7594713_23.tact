struct Base {
 x:Int;
 y:Int?;
}

contract OptMix {
  f1: Base?;
  init() {
    self.f1=Base{x:10,y:null};
  }
}