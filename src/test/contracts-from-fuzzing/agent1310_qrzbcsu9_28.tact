// Non-optional struct default value via initializing nested fields
struct Foo {
  x: Int;
}

contract StructDefaultInit {
  bar: Foo = Foo{ x: 12 };
  init() {
    self.bar = Foo{ x: 42 };
  }
}