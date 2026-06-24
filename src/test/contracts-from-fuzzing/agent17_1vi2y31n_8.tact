struct OptionInNest {
  flag: Bool?;
  inner: InnerOpt?;
}

struct InnerOpt {
  val: Int?;
}

contract NestedOptionals {
  data: OptionInNest;

  init() {
    self.data = OptionInNest{
      flag: null,
      inner: InnerOpt{ val: null }
    };
  }
}