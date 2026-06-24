struct Nested {
  a: Int;
  b: Int?;
}

contract StorageTest {
  data: Nested;

  init() {
    self.data = Nested { a: 1, b: 2 };
  }
}
