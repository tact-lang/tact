struct Nested {
  one: Int;
  two: Bool;
}

contract SimpleNestedTest {
  data: Nested;

  init() {
    self.data = Nested{
      one: 1,
      two: true,
    };
  }
}