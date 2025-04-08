struct OptStr {
  s: String?;
}

contract OptStringTest {
  data: OptStr;

  init() {
    self.data = OptStr{
      s: null,
    };
  }
}