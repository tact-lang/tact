// test persistent fields with string and optional string together

contract Test {
  s: String;
  os: String?;

  init() {
    self.s = "abc";
    self.os = null;
  }
}