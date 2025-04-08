struct Inner {
  a: Int;
  b: Bool;
}

struct Outer {
  x: Int;
  nested: Inner;
}

contract Test {
  st: Outer;

  init() {
    self.st = Outer{x: 5, nested: Inner{a: 3, b: false}};
  }
}