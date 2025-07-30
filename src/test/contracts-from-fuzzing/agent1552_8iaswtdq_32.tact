struct Nest1 {
  x: Int;
  y: String;
}

struct Nest2 {
  a: Nest1;
  b: Nest1;
}

contract NestedDouble {
  inner: Nest2;

  init() {
    self.inner = Nest2{
      a: Nest1{x: 1, y: "a"},
      b: Nest1{x: 2, y: "b"},
    };
  }
}