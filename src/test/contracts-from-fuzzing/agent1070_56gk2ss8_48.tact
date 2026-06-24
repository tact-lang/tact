struct Innermost {
  foo: Int;
}

struct Inner {
  bar: Innermost;
}

struct Mid {
  x: Inner;
}

contract FullNest {
  val: Mid;

  init() {
    self.val = Mid {
      x: Inner {
        bar: Innermost {
          foo: 999
        }
      }
    };
  }
}