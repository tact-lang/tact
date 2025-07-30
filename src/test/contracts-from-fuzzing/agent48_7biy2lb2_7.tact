struct Inner {
  foo: Int?;
  bar: Int?;
}

struct Middle {
  one: Inner;
  two: Inner;
}

struct Outer {
  alpha: Middle;
  beta: Middle;
}

contract TestContract {
  data: Outer;

  init() {
    self.data = Outer{
      alpha: Middle {
        one: Inner { foo: null, bar: null },
        two: Inner { foo: null, bar: null },
      },
      beta: Middle {
        one: Inner { foo: 1, bar: 2 },
        two: Inner { foo: 3, bar: 4 },
      }
    };
  }
}