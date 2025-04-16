// Slightly twisted deep nested optional chain with different defaults
struct Foo {
  a: Int?;
  b: Bool;
}

struct Bar {
  foo: Foo?;
}

struct Baz {
  bar: Bar?;
}

contract TwistedOptionals {
  data: Baz?;

  init() {
    self.data = Baz{
      bar: Bar{
        foo: null,
      },
    };
  }
}