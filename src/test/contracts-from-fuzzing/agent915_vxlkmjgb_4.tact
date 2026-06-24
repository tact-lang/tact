struct OptStruct {
  foo: Int?;
  bar: Bool?;
  baz: String?;
}

contract OptionalsTest {
  x: OptStruct;

  init() {
    self.x = OptStruct{
      foo: null,
      bar: true,
      baz: null
    };
  }
}
