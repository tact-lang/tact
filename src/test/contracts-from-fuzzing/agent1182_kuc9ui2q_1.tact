struct Inner {
  a: Int;
  b: Bool;
}

struct Wrapper {
  inner: Inner;
  c: Int;
  d: Bool;
}

contract Test {
  val: Wrapper;

  init() {
    self.val = Wrapper{
      inner: Inner{ a:1, b:true },
      c: 2,
      d: false,
    };
  }
}
