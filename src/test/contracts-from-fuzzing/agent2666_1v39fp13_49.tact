struct InnerMost {
  value:Int;
}

struct Inner {
  innerMost:InnerMost;
}

struct Outer {
  inner:Inner;
}

contract ThreeNest {
  outer:Outer;

  init() {
    self.outer = Outer{
      inner: Inner{
        innerMost: InnerMost{value: 123}
      }
    };
  }
}