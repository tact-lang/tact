struct S {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract HasOptionalStruct {
  s: S;

  init() {
    self.s = S{ x:null, y:null, z:null };
  }
}