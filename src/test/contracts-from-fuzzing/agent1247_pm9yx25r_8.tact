struct Inner {
  q: Int;
  r: Bool?;
}

struct Outer {
  a: Int;
  b: Bool?;
  c: Inner;
  d: String;
}

struct Wrapper {
  main: Outer;
}

contract DoubleNested {
  wrap: Wrapper;

  init() {
    self.wrap = Wrapper{
      main: Outer{
        a: 42,
        b: null,
        c: Inner{ q: 5, r: true },
        d: "text"
      }
    };
  }
}