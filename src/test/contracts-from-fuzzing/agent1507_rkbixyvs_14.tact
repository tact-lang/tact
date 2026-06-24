struct LargeOpt {
  s: String?;
  b: Bool?;
  i: Int?;
}

struct NestedMany {
  opt1: LargeOpt;
  opt2: LargeOpt;
  opt3: LargeOpt;
}

contract MultiOptStructs {
  m: NestedMany;

  init() {
    self.m = NestedMany{
      opt1: LargeOpt{ s: null, b: null, i: null },
      opt2: LargeOpt{ s: "hello", b: true, i: 123 },
      opt3: LargeOpt{ s: null, b: false, i: null }
    };
  }
}
