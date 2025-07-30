struct Inner {
  a: Int;
  b: String;
}

struct Middle {
  c: Bool;
  d: Inner;
}

struct Outer {
  e: Middle;
  f: Int?;
}

contract Test {
  val: Outer;

  init() {
    self.val = Outer{
      e: Middle{
        c: true,
        d: Inner{ a: 1, b: "x" }
      },
      f: null
    };
  }
}