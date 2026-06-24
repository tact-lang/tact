struct Inner {
  foo: Int;
  bar: Bool;
}

struct Outer {
  inside: Inner;
  num: Int;
  flag: Bool;
}

contract Test {
  state: Outer;

  init() {
    self.state = Outer{
      inside: Inner{
        foo: 42,
        bar: true,
      },
      num: 100,
      flag: false,
    };
  }
}