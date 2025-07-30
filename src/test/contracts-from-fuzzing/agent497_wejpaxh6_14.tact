struct Frag {
  foo: Int;
  bar: Int?;
}

contract TestContract {
  a: Frag;
  b: Frag?;
  c: Frag;

  init() {
    self.a = Frag{foo: 1, bar: null};
    self.b = null;
    self.c = Frag{foo: 3, bar: 4};
  }
}