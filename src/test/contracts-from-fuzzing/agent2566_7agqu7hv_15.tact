struct Wide {
  f1: Int;
  f2: Int;
  f3: Int;
  f4: Int;
  f5: Int;
  f6: Bool;
  f7: String;
  f8: Bool;
  f9: String;
  f10: Bool;
}

contract ManyKinds {
  record: Wide;

  init() {
    self.record = Wide{
      f1: 1,
      f2: 2,
      f3: 3,
      f4: 4,
      f5: 5,
      f6: true,
      f7: "seven",
      f8: false,
      f9: "nine",
      f10: true
    };
  }
}
