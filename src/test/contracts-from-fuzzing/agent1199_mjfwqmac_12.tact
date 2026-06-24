struct DeepOptional {
  x: Int?;
  y: String?;
  z: Bool?;
}

struct Layer2 {
  in1: DeepOptional?;
  in2: DeepOptional?;
}

contract Test12 {
  l2: Layer2;

  init() {
    self.l2 = Layer2{
      in1: DeepOptional{x:null,y:null,z:null},
      in2: null
    };
  }
}