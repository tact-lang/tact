struct Inner {
  a: Int;
  b: Bool;
}

struct Middle {
  inner: Inner;
  s: String;
}

struct Outer {
  mid: Middle;
  addr: Address;
}

contract Test {
  data: Outer;
  init() {
    self.data = Outer{
      mid: Middle{
        inner: Inner{a: 5, b: true},
        s: "ok"
      },
      addr: myAddress()
    };
  }
}