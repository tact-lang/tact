struct OptionalDeep {
  deepStr: String?;
  deepNum: Int?;
}

struct MidOptional {
  deep: OptionalDeep?;
}

struct TopOptional {
  mid: MidOptional?;
}

contract MultiLayerOpt {
  data: TopOptional;

  init() {
    self.data = TopOptional{
      mid: null
    };
  }
}
