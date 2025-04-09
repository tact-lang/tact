struct Inner { foo: Int }

struct Outer {
  nested: Inner? = Inner{foo: 7};
}

contract OptionalDefaultNested {
  st: Outer;

  init() {
    self.st = Outer{};
  }
}
