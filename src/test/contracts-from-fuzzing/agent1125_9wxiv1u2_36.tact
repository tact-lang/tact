struct DeepOpt {
  f: Int?;
  g: Bool?;
  h: Address?;
}

struct MidOpt {
  nested: DeepOpt?;
}

struct OuterOpt {
  val: MidOpt?;
}

contract ChainOpt {
  data: OuterOpt;
  init() {
    self.data = OuterOpt{ val: null };
  }
}