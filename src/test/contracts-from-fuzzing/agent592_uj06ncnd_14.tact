struct HasString {
  text: String;
  flag: Bool;
}

contract StringInStorage {
  s: String;
  inner: HasString;

  init() {
    self.s = "hello";
    self.inner = HasString{text: "world", flag:true};
  }
}