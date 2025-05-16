struct OptionalStructNested {
  innerOpt: Inner?;
}

struct Inner {
  str: String;
  flag: Bool?;
}

contract OptionalStructCombination {
  val: OptionalStructNested;

  init() {
    self.val = OptionalStructNested{
      innerOpt: null
    };
  }
}
