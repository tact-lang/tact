struct BoolLayer {
  flag: Bool;
}

struct OptWithDefault {
  inner: BoolLayer? = null;
}

contract OptionalStructDef {
  val: OptWithDefault;

  init() {
    self.val = OptWithDefault{};
  }
}
