struct DeepMix {
  p: Chain;
  q: OptionWrap?;
}

struct Chain {
  r: Inner;
}

struct Inner {
  s: Int;
  t: Bool;
}

struct OptionWrap {
  x: Int?;
  y: String?;
}

contract Test38 {
  d: DeepMix;

  init() {
    self.d = DeepMix{
      p: Chain{r: Inner{s:1, t:true}},
      q: null
    };
  }
}