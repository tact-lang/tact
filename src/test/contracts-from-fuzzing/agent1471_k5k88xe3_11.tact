struct HasString {
  s1: String;
  s2: String?;
}

contract StringFields {
  mydata: HasString;

  init() {
    self.mydata = HasString{
      s1: "hello",
      s2: null,
    };
  }
}