struct Inner {
  a: Int;
  b: String?;
}

struct Outer {
  c: Bool;
  d: Inner?;
}

contract CrossOptional {
  innerOuter: Outer?;

  init() {
    self.innerOuter = Outer{
      c: true,
      d: Inner{
        a: 33,
        b: null
      }
    };
  }
}