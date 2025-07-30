struct StringStruct {
  str1: String;
  str2: String;
}

contract TestContract {
  s: StringStruct;

  init() {
    self.s = StringStruct{
      str1: "Test1",
      str2: "Test2"
    };
  }
}