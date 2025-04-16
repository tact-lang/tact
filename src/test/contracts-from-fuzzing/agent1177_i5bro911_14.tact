struct InnerMost {
  d: Int;
}

struct Middle {
  b: Int;
  c: InnerMost;
}

contract MultipleStructFields {
  one: Middle;
  two: Middle;

  init() {
    self.one = Middle{ b: 1, c: InnerMost{ d: 2 } };
    self.two = Middle{ b: 3, c: InnerMost{ d: 4 } };
  }
}
