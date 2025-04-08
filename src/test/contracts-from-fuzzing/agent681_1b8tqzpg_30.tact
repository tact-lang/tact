struct InnerMost {
  foo: Int;
}

struct Mid {
  inner: InnerMost;
}

struct Container {
  m: Mid;
}

contract MultiNestTopLevel {
  contain: Container;

  init() {
    self.contain = Container{
      m: Mid{
        inner: InnerMost{ foo: 124 }
      }
    };
  }
}