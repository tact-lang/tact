struct Strings {
  s1: String;
  s2: String;
  s3: String;
}

contract StrTest {
  data: Strings;

  init() {
    self.data = Strings {
      s1: "Hello",
      s2: "World",
      s3: "!",
    };
  }
}