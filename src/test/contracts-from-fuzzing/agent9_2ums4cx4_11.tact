struct OptConcrete {
  s: String?;
  i: Int?;
}

contract DefaultOpt {
  val: OptConcrete;

  init() {
    self.val = OptConcrete{
      s: null,
      i: 123,
    };
  }
}
