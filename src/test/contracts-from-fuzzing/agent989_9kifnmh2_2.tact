struct Nested {
  inner: Inner;
  flag: Bool;
}

struct Inner {
  count: Int;
  valid: Bool;
}

contract DeepTest {
  nestedField: Nested;

  init() {
    self.nestedField = Nested{
      inner: Inner{ count: 3, valid: false },
      flag: true
    };
  }
}