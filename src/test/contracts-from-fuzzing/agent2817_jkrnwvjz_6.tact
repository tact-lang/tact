struct InnerMost {
  x: Int;
}

struct Middle {
  m: InnerMost;
}

struct Outer {
  o: Middle;
}

contract DeepStore {
  deep: Outer;

  init() {
    self.deep = Outer{ o: Middle{ m: InnerMost{ x: 42 } } };
  }
}
