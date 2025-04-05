message Foo {
  bar: Int
}

struct Bar {
  foo: Foo
}

contract Test {
  receive() {
    let x = Bar {
      foo: Foo {
        bar: 123
      }
    };
  }
}