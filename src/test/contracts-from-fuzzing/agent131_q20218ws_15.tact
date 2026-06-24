struct DefaultsMix {
  a: Int = 5;
  b: Bool = true;
  c: Int?;
  d: String = "go";
}

contract DefaultedStructField {
  s: DefaultsMix;

  init() {
    self.s = DefaultsMix{ a: 1, b: false, c: null, d: "init" };
  }
}