struct Foo {
  x: Int? = 5;
}

contract TestContract {
  val: Foo;

  init() {
    self.val = Foo{ x: null };
  }
}