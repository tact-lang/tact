message NegativeTest {
  foo: Foo
}

struct Foo {
  bar: Int
}

contract Test {
  receive(msg: NegativeTest) {}
}