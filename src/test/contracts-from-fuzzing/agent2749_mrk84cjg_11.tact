struct InnerMost {
  a: String;
}

struct Middle {
  m: InnerMost;
}

contract ManyLevels {
  f1: Int;
  f2: Bool?;
  f3: String;
  f4: InnerMost;
  f5: Middle;

  init() {
    self.f1 = 1;
    self.f2 = null;
    self.f3 = "txt";
    self.f4 = InnerMost{ a: "deep" };
    self.f5 = Middle{ m: InnerMost{ a: "deepest" } };
  }
}