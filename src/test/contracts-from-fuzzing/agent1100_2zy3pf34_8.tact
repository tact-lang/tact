struct NestedOptional {
  val: Int?;
  flag: Bool;
}

struct HoldOpt {
  inner: NestedOptional?;
}

contract OptionalDeep {
  ho: HoldOpt;

  init() {
    self.ho = HoldOpt{
      inner: null
    };
  }
}
