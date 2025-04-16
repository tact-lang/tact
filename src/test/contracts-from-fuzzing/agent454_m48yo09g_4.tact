struct Deepest {
  x: Int;
}

struct Middle {
  inner: Deepest;
}

struct Outer {
  middle: Middle;
}

contract TestContract {
  field: Outer;
  init() {
    self.field = Outer{ middle: Middle{ inner: Deepest{ x: 10 }}};
  }
}