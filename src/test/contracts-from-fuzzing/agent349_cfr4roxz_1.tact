struct Nested {
  flag: Bool;
  text: String;
  num: Int?;
}

contract DeepTest {
  mainData: Nested;

  init() {
    self.mainData = Nested{
      flag: true,
      text: "hello",
      num: 123,
    };
  }
}