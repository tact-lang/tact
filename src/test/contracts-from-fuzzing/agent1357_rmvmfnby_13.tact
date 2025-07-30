struct Inner {
  foo: Int;
}

struct Mid {
  inner: Inner?;
}

contract OptOptOpt {
  deeply: Mid?;

  init() {
    self.deeply = null;
  }
}