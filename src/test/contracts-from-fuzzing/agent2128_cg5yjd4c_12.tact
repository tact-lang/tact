struct SubNested {
  v1: Int;
  v2: String?;
}

struct MidNested {
  m: Bool;
  sub: SubNested;
}

struct TopNested {
  t: Int as uint32;
  mid: MidNested;
}

contract DeepMix {
  data: TopNested;

  init() {
    self.data = TopNested{
      t: 99,
      mid: MidNested{
        m: true,
        sub: SubNested{
          v1: -17,
          v2: null
        }
      }
    };
  }
}