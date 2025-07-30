struct DeepOptional {
  inner: InnerOpt?;
}

struct InnerOpt {
  value: Int?;
}

contract TestContract {
  def: DeepOptional;

  init() {
    self.def = DeepOptional{
      inner: null
    };
  }
}