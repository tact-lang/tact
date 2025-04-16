struct Mix {
  n: Int;
  b: Bool;
  s: String;
  o: Int?;
}

contract TwoFields {
  a: Mix;
  b: Mix;

  init() {
    self.a = Mix{ n: 1, b: true, s: "x", o: null };
    self.b = Mix{ n: 2, b: false, s: "y", o: 42 };
  }
}
