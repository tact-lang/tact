// deeply nested optionals of contracts are impossible, but optionals of structs are tested
struct Foo {
  s: String?;
  b: Bool?;
}

struct Bar {
  foo: Foo?;
  val: Int?;
}

struct Baz {
  bar: Bar?;
  flag: Bool;
}

contract BigOptionalChain {
  bchain: Baz;

  init() {
    self.bchain = Baz{
      bar: Bar{
        foo: Foo{
          s: null,
          b: true
        },
        val: null
      },
      flag: false
    };
  }
}