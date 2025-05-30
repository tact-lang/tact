struct Inner {
  s: String;
}

contract ManyStrings {
  a: String;
  b: String?;
  c: Inner;
  d: Inner?;

  init() {
    self.a = "hi";
    self.b = null;
    self.c = Inner{s:"yo"};
    self.d = null;
  }
}