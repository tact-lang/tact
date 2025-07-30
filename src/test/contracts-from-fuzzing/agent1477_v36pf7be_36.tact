struct InnerMost {
  x: Int;
}

struct Inner {
  next: InnerMost;
}

struct Middle {
  nested: Inner;
}

struct OuterMost {
  mid: Middle;
}

contract DeepNest {
  main: OuterMost;

  init() {
    self.main = OuterMost{
      mid: Middle{
        nested: Inner{
          next: InnerMost{x: 1}
        }
      }
    };
  }
}