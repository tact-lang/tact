struct SingleBoolOpt {
  b: Bool?;
}

contract OnlyBoolOpt {
  s: SingleBoolOpt;

  init() {
    self.s = SingleBoolOpt{ b: null };
  }
}