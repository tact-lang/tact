struct Foo { x: Int?; }
struct Bar { y: Bool = false; }

contract MultiStructParams(
  foo: Foo,
  bar: Bar
) {}