struct Boo {
  x: Int;
}

struct Foo {
  y: Int;
  z: Boo;
}

contract TestContract {
  s: Foo;

  init() {
    self.s = Foo{
      y: 5,
      z: Boo{ x: 10 }
    };
  }
}