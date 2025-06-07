struct Outer {
  i: Int;
  s: Inner;
  n: Int?;
}

struct Inner {
  flag: Bool;
  t: Tiny;
}

struct Tiny {
  val: Int;
}

contract DeepStructChain {
  data: Outer;

  init() {
    self.data = Outer{
      i: 1,
      s: Inner{
        flag: true,
        t: Tiny{ val: 2 }
      },
      n: null
    };
  }
}