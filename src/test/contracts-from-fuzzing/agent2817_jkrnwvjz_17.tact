struct ContainingOptional {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract OptionalInnerStruct {
  data: ContainingOptional;

  init() {
    self.data = ContainingOptional{ x:null, y:null, z:null };
  }
}
