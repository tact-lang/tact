struct Weird {
  foo: Int?;
  bar: Bool?;
  baz: String?;
}

contract WeirdTest {
  s: Weird;

  init() {
    self.s = Weird{
      foo: null,
      bar: null,
      baz: null
    };
  }
}