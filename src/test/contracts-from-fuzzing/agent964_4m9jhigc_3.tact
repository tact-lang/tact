struct Defaulted {
  a: Int = 5;
  b: Bool = false;
  c: String = "constant";
  d: Int?; // implicit default null
  e: Bool?; // implicit default null
  f: String?; // implicit default null
}

contract DefaultsCombo {
  data: Defaulted;

  init() {
    self.data = Defaulted {
      // omit everything to test defaults
    };
  }
}
