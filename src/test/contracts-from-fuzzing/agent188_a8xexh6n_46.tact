struct TwoStructs {
  aa: Int?;
  bb: Bool?;
}

contract OptionalStructInit {
  s: TwoStructs = TwoStructs{ aa:null, bb:null };

  init() {
    self.s = TwoStructs{ aa:1, bb:true };
  }
}