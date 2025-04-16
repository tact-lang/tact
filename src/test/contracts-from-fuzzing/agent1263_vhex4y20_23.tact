struct Inner {
  x: Int;
}

struct Middle {
  inner: Inner?;
}

struct Outer {
  middle: Middle?;
}

contract TestContract {
  nested: Outer;

  init() {
    self.nested = Outer {
      middle: Middle {
        inner: Inner {
          x: 999
        }
      }
    };
  }
}