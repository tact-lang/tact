struct OptionalMix {
  s: String?;
  i: Int?;
  b: Bool?;
}

contract NestedOptMix {
  f: OptionalMix;

  init() {
    self.f = OptionalMix{s:"x",i:null,b:true};
  }
}