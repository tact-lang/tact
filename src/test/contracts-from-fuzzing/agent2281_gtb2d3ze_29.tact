struct HasString {
  s: String;
}
contract StrStruct {
  inner: HasString;

  init() {
    self.inner = HasString{ s: "hello" };
  }
}