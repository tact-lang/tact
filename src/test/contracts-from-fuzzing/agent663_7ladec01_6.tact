struct DeepOptInner {
  p: Int?;
  q: Bool?;
}

struct MidLayer {
  r: DeepOptInner;
  s: Bool?;
}

struct TopLayer {
  t: MidLayer;
  u: Int?;
}

contract DeepOptOnly {
  data: TopLayer;
  init() {
    self.data = TopLayer{
      t: MidLayer{
        r: DeepOptInner{ p: null, q: true },
        s: false },
      u: null
    };
  }
}