struct MultiOption {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract ResetOpt {
  f: MultiOption = MultiOption{ x:null, y:null, z:null };
  init() {
    self.f = MultiOption{ x:5, y:true, z:"x" };
  }
}