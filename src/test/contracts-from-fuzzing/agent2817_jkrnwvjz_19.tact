contract ChainOpt {
  nested: Nested?;

  init() {
    self.nested = null;
  }
}

struct Nested {
  val: Inner;
}

struct Inner {
  x: Int;
}
