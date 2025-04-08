struct A {
  x: Int;
}

struct B {
  y: Int;
}

struct Container {
  sa: A;
  sb: B;
  flag: Bool;
}

contract Test {
  store: Container;

  init() {
    self.store = Container{
      sa: A{ x: 1 },
      sb: B{ y: 2 },
      flag: true,
    };
  }
}