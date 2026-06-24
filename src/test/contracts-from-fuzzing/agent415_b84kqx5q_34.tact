contract MixedDefaultAndInit {
  a: Int=1;
  b: String;

  init() {
    self.b = "aaa";
  }
}