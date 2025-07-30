struct DeepOptional {
  opt1: Int?;
  opt2: Bool?;
  opt3: String?;
}

struct WrapOpt {
  inner: DeepOptional?;
}

struct Top {
  topVal: Int;
  optWrap: WrapOpt?;
}

contract OptionalComplex {
  data: Top;
  init() {
    self.data = Top{
      topVal: 1,
      optWrap: null
    };
  }
}