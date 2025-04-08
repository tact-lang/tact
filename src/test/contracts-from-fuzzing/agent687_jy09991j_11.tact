struct StringStruct {
  s1: String;
  s2: String?;
  s3: String = "hello";
  s4: String? = null;
}

contract StringContract {
  data: StringStruct;

  init() {
    self.data = StringStruct{
      s1: "hi",
      s2: null
    };
  }
}