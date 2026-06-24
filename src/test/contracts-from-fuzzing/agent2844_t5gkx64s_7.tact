struct InnerMost {
  a: Bool;
}

struct Inner {
  x: Int;
  innermost: InnerMost;
}

struct Mid {
  y: String;
  inner: Inner;
  optStr: String?;
}

struct Outer {
  z: Int?;
  mid: Mid;
  addr: Address;
}

contract TestContract {
  s: Outer;

  init() {
    self.s = Outer{
      z: null,
      mid: Mid{
        y: "hey",
        inner: Inner{
          x: 5,
          innermost: InnerMost{
            a: true
          }
        },
        optStr: null
      },
      addr: myAddress()
    };
  }
}