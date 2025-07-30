struct Foo { x: Int; }
struct Bar { y: Bool; }

contract MixParams(
  foo: Foo?,
  bar: Bar,
  name: String,
  amount: Int
) {}
