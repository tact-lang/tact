struct LongStringDefaults {
  greeting: String = "hello";
  target: String = "world";
  exclaim: String = "!";
}

contract StringDefaults {
  data: LongStringDefaults;

  init() {
    self.data = LongStringDefaults{};
  }
}