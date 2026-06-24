struct LowNested {
  v: Int?;
}

struct MidNested {
  low: LowNested?;
}

struct TopNested {
  mid: MidNested?;
}

contract ManyLayeredOptionals {
  nested: TopNested;

  init() {
    self.nested = TopNested { mid: null };
  }
}