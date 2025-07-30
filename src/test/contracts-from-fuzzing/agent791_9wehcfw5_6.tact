struct OptionalNest {
  nest: Nested?;
}

struct Nested {
  val: Int?;
}

contract OptionalNestContract {
  f: OptionalNest;

  init() {
    self.f = OptionalNest{ nest: Nested{ val: null } };
  }
}