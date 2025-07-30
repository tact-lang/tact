struct DeepOptional {
  val: Int?;
  inner: NestedOpt?;
}

struct NestedOpt {
  flag: Bool?;
}

contract Test {
  dopt: DeepOptional;

  init() {
    self.dopt = DeepOptional{
      val: null,
      inner: NestedOpt{
        flag: null
      },
    };
  }
}
