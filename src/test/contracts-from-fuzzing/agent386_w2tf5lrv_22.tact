struct RecOpt {
  a: Int?;
  b: Bool?;
}

struct MRecOpt {
  rec: RecOpt?;
}

contract MultiOpt {
  val: MRecOpt = MRecOpt{rec: null};

  init() {
    self.val = MRecOpt{rec: RecOpt{a: 7, b: true}};
  }
}
