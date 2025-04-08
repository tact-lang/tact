struct NestedOptional {
  inner: Int?;
}

struct OptionalContainer {
  nested: NestedOptional?;
}

struct Outer {
  cont: OptionalContainer?;
}

contract MultiOpt {
  data: Outer;

  init() {
    self.data = Outer{ cont: null };
  }
}