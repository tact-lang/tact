struct OptionalInner {
  x: Int?;
  y: String?;
}

struct NestedOptional {
  innerOpt: OptionalInner?;
}

contract OptionalStorage {
  data: NestedOptional;

  init() {
    self.data = NestedOptional{ innerOpt: null };
  }
}
