struct Foo {
  val: Int as uint32;
  small: Int as uint4;
}

struct Bar {
  foo: Foo;
  big: Int;
}

contract SerializeFormats {
  data: Bar;

  init() {
    self.data = Bar{
      foo: Foo{
        val: 12,
        small: 3
      },
      big: 100
    };
  }
}