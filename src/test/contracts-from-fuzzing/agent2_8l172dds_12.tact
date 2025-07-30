// Mix of constants and persistent variables
contract Test {
  foo: Int = 1;
  bar: Bool = false;
  const MAGIC: Int = 42;
  baz: String = "Hello";

  init() {
    self.foo = 10;
    self.bar = true;
    self.baz = "World";
  }
}