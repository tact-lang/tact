struct NestedWithOptionals {
  inner1: Inner?;
  inner2: Inner;
}

struct Inner {
  x: Int?;
  y: String?;
}

contract OptionalNest {
  storage: NestedWithOptionals;
  init() {
    self.storage = NestedWithOptionals{
      inner1: null,
      inner2: Inner{
        x: null,
        y: "hello"
      }
    };
  }
}