struct OptionalMix {
  oi: Int?;
  os: String?;
  ob: Bool?;
}

struct NestedOptionals {
  n1: OptionalMix;
  n2: OptionalMix;
}

contract TestContract {
  innerOpts: NestedOptionals;
  init() {
    self.innerOpts = NestedOptionals{
      n1: OptionalMix{ oi: 10, os: null, ob: true },
      n2: OptionalMix{ oi: null, os: "abc", ob: null }
    };
  }
}