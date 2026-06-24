struct IntAndString {
  id: Int;
  name: String;
  info: String?;
}

contract IntStringTest {
  data: IntAndString;

  init() {
    self.data = IntAndString{
      id: 1,
      name: "Hello",
      info: null
    };
  }
}