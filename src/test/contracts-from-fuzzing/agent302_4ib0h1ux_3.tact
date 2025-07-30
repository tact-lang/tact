struct Inner {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Int?;
  f5: String?;
}

contract Complex {
  nested: Inner;

  init() {
    self.nested = Inner{
      f1: 5,
      f2: false,
      f3: "ok",
      f4: null,
      f5: "maybe"
    };
  }
}
