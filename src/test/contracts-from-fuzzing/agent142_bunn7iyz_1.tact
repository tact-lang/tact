struct InnerMost { x: Int; }

struct Inner2 {
  a: Int;
  optInnerMost: InnerMost?;
}

struct Middle {
  m: Inner2;
}

struct Outer {
  outerVal: Int;
  middle: Middle;
  optMiddle: Middle?;
  optInner2: Inner2?;
  deepOpt: InnerMost?;
}

contract DeepNestTest {
  store: Outer;

  init() {
    self.store = Outer{
      outerVal: 1,
      middle: Middle {
        m: Inner2 {
          a: 2,
          optInnerMost: InnerMost { x: 3 },
        },
      },
      optMiddle: null,
      optInner2: null,
      deepOpt: null,
    };
  }
}