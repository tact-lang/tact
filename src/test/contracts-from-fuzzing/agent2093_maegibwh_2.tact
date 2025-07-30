struct Inner {
  a: Int;
  b: Bool;
  c: Address;
}

struct Outer {
  i: Int;
  inner: Inner;
  flag: Bool;
}

contract Test {
  state: Outer;

  init() {
    self.state = Outer{
      i: 100,
      inner: Inner{
        a: 1,
        b: false,
        c: myAddress(),
      },
      flag: true,
    };
  }
}
