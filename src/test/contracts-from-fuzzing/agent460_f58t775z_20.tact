struct InnerMost {
  value: Int;
}

struct InnerOpt {
  field: InnerMost?;
}

struct MiddleChain {
  part1: InnerOpt?;
  part2: InnerMost?;
}

contract ComposedOpts {
  data: MiddleChain = MiddleChain{
    part1: null,
    part2: null
  };

  init() {
    self.data = MiddleChain{
      part1: InnerOpt{ field: InnerMost{ value: 1 } },
      part2: InnerMost{ value: 2 }
    };
  }
}
