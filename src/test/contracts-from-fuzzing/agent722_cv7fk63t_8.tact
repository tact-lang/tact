struct InnerMost {
  a: String;
}

struct Inner {
  innermost: InnerMost;
}

struct Middle {
  inner: Inner;
}

struct Outer {
  middle: Middle;
}

contract DeepChain {
  o: Outer;
  init() {
    self.o = Outer{
      middle: Middle{
        inner: Inner{
          innermost: InnerMost{a:"final"}
        }
      }
    };
  }
}