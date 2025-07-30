struct NestedStrOpt {
  s: String?;
}

struct Outer {
  inner: NestedStrOpt;
}

contract OptionalStringNest {
  data: Outer;

  init() {
    self.data = Outer{
      inner: NestedStrOpt{
        s: null
      }
    };
  }
}