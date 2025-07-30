struct InnerMost {
  flag: Bool;
}

struct Inner {
  im: InnerMost;
}

struct Mid {
  inner: Inner;
}

struct Outer {
  mid: Mid;
}

contract MultiNestedDeep {
  out: Outer;

  init() {
    self.out = Outer{
      mid: Mid{
        inner: Inner{
          im: InnerMost{
            flag: false
          }
        }
      }
    };
  }
}