struct Deep {
  nested: Middle;
}

struct Middle {
  nested: Bottom;
}

struct Bottom {
  x: Int;
}

contract TestContract {
  d: Deep;

  init() {
    self.d = Deep{nested: Middle{nested: Bottom{x: 123}}};
  }
}