struct HasStringAndOption {
  text: String;
  optText: String?;
}

contract TextOptions {
  s: HasStringAndOption;

  init() {
    self.s = HasStringAndOption{
      text: "Hello",
      optText: null
    };
  }
}