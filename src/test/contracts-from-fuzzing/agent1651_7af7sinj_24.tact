struct Stringy {
  a: String;
  b: String;
}

contract ManyStrings {
  s: Stringy;
  a: String;
  b: String;

  init() {
    self.s = Stringy{ a: "x", b: "y" };
    self.a = "alpha";
    self.b = "beta";
  }
}