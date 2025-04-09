struct Inner {
  x: Int = 1;
  y: Int = 2;
}

struct Mid {
  inner: Inner;
  b: Bool = true;
}

struct Outer {
  mid: Mid;
  s: String = "hi";
}

contract DefaultsDeep {
  val: Outer;

  init() {
    self.val = Outer{
      mid: Mid{
        inner: Inner{},
        b: true
      },
      s: "hello"
    };
  }
}