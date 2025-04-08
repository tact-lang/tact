struct PrimOpts {
  x: Int?;
  y: Bool?;
  z: Cell?;
}

contract OptionalPrimitives {
  data: PrimOpts;

  init() {
    self.data = PrimOpts{ x:null, y:true, z:null };
  }
}