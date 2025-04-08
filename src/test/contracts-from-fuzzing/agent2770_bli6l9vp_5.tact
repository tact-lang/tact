struct StringStruct {
  s: String;
  optS: String?;
}

contract StringFields {
  storage: StringStruct;

  init() {
    self.storage = StringStruct{
      s: "test",
      optS: null
    };
  }
}