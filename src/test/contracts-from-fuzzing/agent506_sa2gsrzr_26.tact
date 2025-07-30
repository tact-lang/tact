struct SmallOptional {
  o: Int?;
}

struct MidOpt {
  s1: SmallOptional?;
  s2: SmallOptional?;
}

contract OptionalSiblings {
  val: MidOpt;
  init() {
    self.val = MidOpt{
      s1: SmallOptional{o:null},
      s2: null
    };
  }
}