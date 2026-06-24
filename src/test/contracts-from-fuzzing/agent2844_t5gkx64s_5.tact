struct Inner {
  b: Bool?;
}

struct Middle {
  s: String;
  inner: Inner;
}

struct Outer {
  int1: Int;
  mid: Middle;
  addr: Address?;
}

contract TestContract {
  data: Outer;

  init() {
    self.data = Outer{
      int1: 5,
      mid: Middle{
        s: "hi",
        inner: Inner{
          b: null
        }
      },
      addr: null
    };
  }
}