struct SerialOptional {
  a: Int as uint8;
  b: Int?;
  c: String?;
}

contract SerialOptTest {
  data: SerialOptional;

  init() {
    self.data = SerialOptional{
      a: 1,
      b: null,
      c: null
    };
  }
}