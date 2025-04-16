struct Sub {
  b: Bool;
  c: Int?;
}

struct Mid {
  sub: Sub;
  subOpt: Sub?;
}

struct Top {
  mid: Mid;
  midOpt: Mid?;
}

contract DeepOptionalChains {
  data: Top;

  init() {
    self.data = Top{
      mid: Mid{
        sub: Sub{ b: true, c: 1 },
        subOpt: null
      },
      midOpt: null
    };
  }
}