struct Sub {
  b: Bool;
}

struct Container {
  sub: Sub?;
  count: Int;
}

contract OptStructWithReq {
  foo: Container;

  init() {
    self.foo = Container{sub: null, count: 777};
  }
}