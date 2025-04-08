struct Foo {
  x: Int;
}

struct Bar {
  x: Bool;
}

struct BothOpt {
  foo: Foo?;
  bar: Bar?;
}

contract NestedOptsContract {
  f: BothOpt;

  init() {
    self.f = BothOpt{ foo: null, bar: null };
  }
}
