struct BoolOpt {
  f1: Bool; f2: Bool?; f3: Bool; f4: Bool?;
}

contract OnlyBools {
  state: BoolOpt;

  init() {
    self.state = BoolOpt{
      f1: true,
      f2: false,
      f3: false,
      f4: null
    };
  }
}