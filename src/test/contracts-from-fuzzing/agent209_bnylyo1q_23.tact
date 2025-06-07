struct InnerMost {
  x: Int;
}
struct Inner {
  a: Int;
  im: InnerMost;
}
struct Outer {
  b: Bool;
  innerOpt: Inner?;
}

contract TestContract {
  data: Outer;

  init() {
    self.data = Outer{
      b:true,
      innerOpt: Inner{
        a: 10,
        im: InnerMost{x: 20}
      }
    };
  }
}