struct DeepNest {
  d: Int;
  e: Bool;
}

struct Middle {
  c: DeepNest;
  f: String;
}

struct Outer {
  a: Int;
  b: Middle;
}

contract Test {
  val: Outer;

  init() {
    self.val = Outer{
      a: 1,
      b: Middle{
        c: DeepNest{ d: 42, e: false },
        f: "hello",
      },
    };
  }
}