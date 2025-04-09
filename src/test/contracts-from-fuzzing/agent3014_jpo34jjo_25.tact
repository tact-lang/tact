// Optional entire nested struct containing defaults
struct Foo {
  x: Int = 1;
  y: Bool = false;
}

contract OptionalStruct {
  f: Foo?;

  init() {
    self.f = null;
  }
}