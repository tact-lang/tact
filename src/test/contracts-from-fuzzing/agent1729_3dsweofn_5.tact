struct Inner {
  n: Int;
}

struct Outer {
  in1: Inner;
  in2: Inner;
  flag: Bool;
}

contract TestContract {
  outer: Outer;

  init() {
    self.outer = Outer{
      in1: Inner{ n: 1 },
      in2: Inner{ n: 2 },
      flag: true,
    };
  }
}