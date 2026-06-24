struct One {
  x: Int;
}

struct Two {
  a: One;
  b: One;
}

struct Three {
  inner: Two;
}

contract DeepFields {
  data: Three;

  init() {
    self.data = Three{
      inner: Two{
        a: One{x: 1},
        b: One{x: 2},
      }
    };
  }
}