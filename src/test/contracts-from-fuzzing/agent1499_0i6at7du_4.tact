struct Level1 {
  foo: Int;
  bar: Bool;
}

struct Level2 {
  inner: Level1;
}

contract NestedStructTest {
    nested: Level2?;

    init() {
        self.nested = null;
    }
    receive() {}
}