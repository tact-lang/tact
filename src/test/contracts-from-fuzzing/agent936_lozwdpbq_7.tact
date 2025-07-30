struct HasString {
  s: String;
  num: Int;
  flag: Bool;
}

contract TestContract {
  data: HasString;

  init() {
    self.data = HasString{
      s: "hello",
      num: 7,
      flag: true,
    };
  }
}
