// contract field with struct that has optional primitive with a default value
struct Foo { val: Int? = null; }

contract Test {
  foo: Foo = Foo{};

  init() {
    self.foo = Foo{ val: 123 };
  }
}