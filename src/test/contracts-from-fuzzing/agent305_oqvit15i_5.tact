struct Middle {
  x: Int;
  y: Bool?;
}

struct Container {
  m1: Middle;
  m2: Middle;
}

contract MultiNestedOptional {
  c: Container;

  init() {
    self.c = Container{
      m1: Middle{ x: 10, y: null },
      m2: Middle{ x: 20, y: true },
    };
  }
}