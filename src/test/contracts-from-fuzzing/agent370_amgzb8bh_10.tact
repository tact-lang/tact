struct Inner {
  f1: Int = 0;
  f2: String = "";
}

struct Middle {
  midVal: Int = 1;
  inner: Inner = Inner{};
}

contract DefaultsChain {
  middle: Middle;

  init() {
    self.middle = Middle{};
  }
}