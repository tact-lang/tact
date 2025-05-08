contract NestedStructOpt {
  s: Outer?;

  init() {
    self.s = null;
  }
}

struct Outer {
  a: Inner;
}

struct Inner {
  foo: Int;
}