struct DeepOptional {
  innerOpt: Nested?;
}

struct Nested {
  val: Int?;
}

contract DeepNull {
  state: DeepOptional;

  init() {
    self.state = DeepOptional{
      innerOpt: null,
    };
  }
}
