// optional struct initialized to null explicitly
struct Foo {
  x: Int;
}

contract OptNull {
  s: Foo?;

  init() {
    self.s = null;
  }
}