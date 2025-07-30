struct Mix {
  a: Int;
  b: String;
  c: Bool?;
}

contract CombinedInit {
  m: Mix = Mix{ a: 0, b: "start", c: null };

  init() {
    self.m = Mix{ a: 42, b: "changed", c: true };
  }
}