struct DeepOpt {
  opt: Int?;
}

struct Wrapper {
  deep: DeepOpt?;
}

contract OptionalStructDeep {
  w: Wrapper?;

  init() {
    self.w = Wrapper{
      deep: DeepOpt{opt: null}
    };
  }
}