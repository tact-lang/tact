struct InnerMost {
  v: Int;
}

struct Inner {
  i: InnerMost;
}

struct Outer {
  o: Inner;
}

contract DeepNest {
  val: Outer;

  init() {
    self.val = Outer{
      o: Inner{
        i: InnerMost{
          v: 999
        }
      }
    };
  }
}