struct BoolOnly {
  x: Bool;
  y: Bool;
  z: Bool;
  w: Bool;
}

contract BoolsPacked {
  bField: BoolOnly;

  init() {
    self.bField = BoolOnly{
      x:false,y:true,z:false,w:true
    };
  }
}
