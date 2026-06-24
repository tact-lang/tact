struct Compose {
  a: Int? as uint32;
  b: Bool;
  c: String?;
}

contract ComposeMix {
  x: Compose;

  init() {
    self.x = Compose{a:null,b:true,c:null};
  }
}
