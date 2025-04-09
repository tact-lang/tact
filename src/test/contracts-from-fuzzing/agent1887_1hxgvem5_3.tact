struct Deep {
  level1: Int;
  opt: Bool?;
  nested: Nested;
}

struct Nested {
  inner: Inner;
}

struct Inner {
  val: Int;
}

contract DeepNestedTest {
  data: Deep;

  init() {
    self.data = Deep{
      level1: 1,
      opt: null,
      nested: Nested{
        inner: Inner{ val: 100 }
      }
    };
  }
}