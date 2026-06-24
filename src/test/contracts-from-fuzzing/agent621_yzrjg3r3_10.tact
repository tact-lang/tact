struct StringNest {
  str1: String;
  optStr: String?;
  flag: Bool;
}

contract Test {
  storage: StringNest;

  init() {
    self.storage = StringNest{
      str1: "Hello",
      optStr: null,
      flag: true,
    };
  }
}
