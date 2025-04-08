struct ManyDeep {
  f1: Int?;
  f2: Int;
  f3: Bool?
}

contract OptionalMix {
  x: ManyDeep;

  init() {
    self.x = ManyDeep{f1:null,f2:42,f3:null};
  }
}