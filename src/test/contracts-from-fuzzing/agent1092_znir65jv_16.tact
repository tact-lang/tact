struct InnerMost {
  x: Int;
}

struct Inner {
  val: InnerMost;
}

struct Outer {
  w: Int;
  inner: Inner;
  z: Int;
}

contract MiddleFields {
  data: Outer;

  init() {
    self.data = Outer{
      w: 5,
      inner: Inner{
        val: InnerMost{
          x: 1
        }
      },
      z: 9
    };
  }
}
