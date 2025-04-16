struct StrTest {
  message: String;
  info: String;
}

contract StringFields {
  s: StrTest;

  init() {
    self.s = StrTest{
      message: "Hello",
      info: "World"
    };
  }
}