contract SimpleContract {
  foo: Int;

  init() {
    self.foo = 10;
  }
}

contract CollisionContract {
  foo: Int;

  init() {
    self.foo = 20;
  }
}