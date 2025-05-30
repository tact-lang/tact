struct MultiOption {
  f1: Int?;
  f2: Bool?;
  f3: String?;
}

contract OptMix {
  dataOpt: MultiOption?;

  init() {
    self.dataOpt = MultiOption{
      f1: null,
      f2: true,
      f3: null
    };
  }
}
