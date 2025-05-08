struct MultipleOpt {
  int1: Int?;
  int2: Int?;
  bool1: Bool?;
  bool2: Bool?;
}

contract OptionalsHeavy {
  s: MultipleOpt;

  init() {
    self.s = MultipleOpt{
      int1:null,
      int2:null,
      bool1:null,
      bool2:null,
    };
  }
}