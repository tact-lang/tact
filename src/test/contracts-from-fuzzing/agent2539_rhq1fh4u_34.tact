struct DeepOpt {
  a: Int?;
}

struct MidOpt {
  d: DeepOpt?;
}

struct TopOpt {
  m: MidOpt?;
}

contract MultilevelOpts {
  t: TopOpt;

  init() {
    self.t = TopOpt{m: MidOpt{d: DeepOpt{a:122}}};
  }
}